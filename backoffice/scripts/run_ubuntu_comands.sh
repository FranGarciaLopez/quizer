#!/bin/bash

#pg_restore -U postgres -Ft -v -C -d --clean tfg-db /backup/tfg-db.sql
#pg_dump -U postgres -Ft -v --data-only tfg-db > /backup/tfg-db.sql
#psql -U postgres -f /backup/tfg-db.sql

echo "Installing postgres on Ubuntu"
cd "../../api/backup/"
mkdir -p ./logs
echo "  - Installing postgres"    && sudo apt-get update && sudo apt-get install -qq postgresql-client                >> ./logs/postgres_logs.log
echo "  - Create database"        && psql postgresql://postgres:changeme@localhost:5432 -c "CREATE DATABASE \"tfg-db\"" >> ./logs/postgres_logs.log
#echo "  - Loading data for tests" && psql postgresql://postgres:changeme@localhost:5432 -f tfg-db.sql                 >> ./logs/postgres_logs.log

echo "  - Loading data for tests" && export PGPASSWORD=yourpassword && pg_dump -U postgres -Ft -v --data-only tfg-db > tfg-db.sql
#echo "  - Loading data for tests" && export PGPASSWORD=yourpassword && pg_restore -U postgres -Ft -v -C -d tfg-db tfg-db.sql
psql postgresql://postgres:changeme@localhost:5432 \dt

echo "Installing headless chromium"
mkdir -p ./logs
echo "  - Installing dependencies..." &&  sudo apt-get install -y libappindicator1 fonts-liberation > ./logs/chromium_logs.log
#echo "  - Installing dependencies..." &&  sudo apt-get install -f >> ./logs/chromium_logs.log
echo "  - Downloading headless Chromium" && wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb >> ./logs/chromium_logs.log
echo "  - Installing headless Chromium" && sudo dpkg -i google-chrome*.deb >> ./logs/chromium_logs.log
