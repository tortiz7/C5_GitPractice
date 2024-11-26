#/bin/bash

echo "give me a file mate:"
read file

if [ -r "$file" ]; then
  echo "'$file' is readable"
else
  echo "'$file' is not readable"
fi

if [ -w "$file" ]; then
  echo "'$file' is writable"
else
  echo "'$file' is not writable"
fi

if [ -x "$file" ]; then
  echo "'$file' is exectable"
else
  echo "'$file' is not executable"
fi
