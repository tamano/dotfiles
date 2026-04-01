#!/bin/sh
# Create working directories

for dir in "$HOME/workspace/develop" "$HOME/workspace/lab"; do
  if [ -d "$dir" ]; then
    echo "[skip] $dir already exists"
  else
    mkdir -p "$dir"
    echo "[create] $dir created"
  fi
done
