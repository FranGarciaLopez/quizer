#!/bin/bash


#pg_dump -U postgres tfg-db > /backup/tfg-db.sql
#psql -U postgres -f /backup/tfg-db.sql

echo "Installing headless chromium"
mkdir -p ./logs
cd "../backoffice"
mkdir -p ./logs
echo "  - Installing dependencies..." &&  sudo apt-get install -y libappindicator1 fonts-liberation > ./logs/chromium_logs.log
#echo "  - Installing dependencies..." &&  sudo apt-get install -f >> ./logs/chromium_logs.log
echo "  - Downloading headless Chromium" && wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb >> ./logs/chromium_logs.log
echo "  - Installing headless Chromium" && sudo dpkg -i google-chrome*.deb >> ./logs/chromium_logs.log
