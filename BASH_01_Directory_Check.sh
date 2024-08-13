#!/bin/bash

if [  -d ~/backup ]; then
  echo "Backup directory exists"
else
  mkdir ~/backup
  echo "Backup directory created"
fi
