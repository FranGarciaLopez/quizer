#!/bin/bash


#pg_dump -U postgres tfg-db > /backup/tfg-db.sql
#psql -U postgres -f /backup/tfg-db.sql

echo "Installing postgres on Ubuntu"
cd "../../api/backup/"
mkdir -p ./logs
echo "  - Installing postgres"             && sudo apt-get update && sudo apt-get install -q postgresql-client                  >> ./logs/postgres_logs.log
echo "  - Loading database backup for tests" && psql postgresql://postgres:changeme@localhost:5432 -f tfg-db.sql           >> ./logs/postgres_logs.log
psql postgresql://postgres:changeme@localhost:5432 \\dt

echo "Installing headless chromium"
mkdir -p ./logs
cd "../backoffice"
mkdir -p ./logs
echo "  - Installing dependencies..." &&  sudo apt-get install -y libappindicator1 fonts-liberation > ./logs/chromium_logs.log
#echo "  - Installing dependencies..." &&  sudo apt-get install -f >> ./logs/chromium_logs.log
echo "  - Downloading headless Chromium" && wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb >> ./logs/chromium_logs.log
echo "  - Installing headless Chromium" && sudo dpkg -i google-chrome*.deb >> ./logs/chromium_logs.log
