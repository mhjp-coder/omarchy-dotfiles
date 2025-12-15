#!/usr/bin/env bash
# Grants the current user passwordless sudo access.

echo "$USER ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/01_$USER
sudo chmod 440 /etc/sudoers.d/01_$USER