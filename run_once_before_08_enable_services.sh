#!/bin/bash

# Enabling required services
sudo systemctl enable bluetooth.service

# Enabling WiFi
sudo systemctl enable iwd
