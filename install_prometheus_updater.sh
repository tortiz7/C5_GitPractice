#!/bin/bash

# Update the system
sudo yum update -y

# Install Node.js and npm
curl -sL https://rpm.nodesource.com/setup_14.x | sudo bash -
sudo yum install -y nodejs

# Create a directory for the application
sudo mkdir -p /opt/prometheus-updater
cd /opt/prometheus-updater

# Create package.json
cat << EOF > package.json
{
  "name": "prometheus-config-updater",
  "version": "1.0.0",
  "description": "A web app to update Prometheus configuration",
  "main": "app.js",
  "dependencies": {
    "express": "^4.17.1",
    "js-yaml": "^4.1.0"
  }
}
EOF

# Create app.js
cat << EOF > app.js
const express = require('express');
const yaml = require('js-yaml');
const fs = require('fs');
const path = require('path');

const app = express();
const port = 4000;  // Changed port to 4000

app.use(express.json());

const configPath = '/opt/prometheus/prometheus.yml';

function readPrometheusConfig() {
  const fileContents = fs.readFileSync(configPath, 'utf8');
  return yaml.load(fileContents);
}

function writePrometheusConfig(config) {
  const yamlStr = yaml.dump(config);
  fs.writeFileSync(configPath, yamlStr, 'utf8');
}

app.post('/add-target', (req, res) => {
  const { job, target } = req.body;

  if (!job || !target) {
    return res.status(400).json({ error: 'Both job and target are required' });
  }

  try {
    const config = readPrometheusConfig();

    let jobConfig = config.scrape_configs.find(sc => sc.job_name === job);
    if (!jobConfig) {
      jobConfig = { job_name: job, static_configs: [{ targets: [] }] };
      config.scrape_configs.push(jobConfig);
    }

    if (!jobConfig.static_configs[0].targets.includes(target)) {
      jobConfig.static_configs[0].targets.push(target);
      writePrometheusConfig(config);

      const { execSync } = require('child_process');
      execSync('sudo systemctl reload prometheus');

      res.json({ message: 'Target added successfully' });
    } else {
      res.json({ message: 'Target already exists' });
    }
  } catch (error) {
    console.error('Error updating Prometheus config:', error);
    res.status(500).json({ error: 'Failed to update Prometheus configuration' });
  }
});

app.listen(port, () => {
  console.log(\`Server running at http://localhost:\${port}\`);
});
EOF

# Install dependencies
sudo npm install

# Create a systemd service file
cat << EOF | sudo tee /etc/systemd/system/prometheus-updater.service
[Unit]
Description=Prometheus Config Updater
After=network.target

[Service]
ExecStart=/usr/bin/node /opt/prometheus-updater/app.js
Restart=always
User=root
Group=root
Environment=PATH=/usr/bin:/usr/local/bin
Environment=NODE_ENV=production
WorkingDirectory=/opt/prometheus-updater

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd, enable and start the service
sudo systemctl daemon-reload
sudo systemctl enable prometheus-updater
sudo systemctl start prometheus-updater

# Print the public IP address
echo "Installation complete. The Prometheus Config Updater is now running as a service."
echo "You can send POST requests to http://$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4):4000/add-target"
echo "Example: curl -X POST -H \"Content-Type: application/json\" -d '{\"job\": \"new_job\", \"target\": \"localhost:8080\"}' http://$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4):4000/add-target"
