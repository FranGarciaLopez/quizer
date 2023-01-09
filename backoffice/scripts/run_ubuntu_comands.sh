#!/bin/bash


#pg_dump -U postgres tfg-db > /backup/tfg-db.sql
#psql -U postgres -f /backup/tfg-db.sql
echo "Installing postgres on Ubuntu"
cd "../../api/backup/"
mkdir -p ./logs
echo "  -dir created"
echo "  - Installing postgres..."             && sudo apt-get update                                             > ./logs/postgres_logs.log
echo "  - Installing postgres..."             && sudo apt install postgresql postgresql-client                  >> ./logs/postgres_logs.log
echo "  - Starting postgres server"           && pg_ctlcluster                                                  >> ./logs/postgres_logs.log
echo "  - Starting postgres server"           && sudo -u postgres pg_ctlcluster 12 main start                   >> ./logs/postgres_logs.log
echo "  - Creating new database"              && sudo -u postgres  createdb tfg-db                              >> ./logs/postgres_logs.log
echo "  - Creating database backup for tests" && export PGPASSWORD=123456                                       >> ./logs/postgres_logs.log
echo "  - Creating database backup for tests" && pg_dump -U postgres -d backup > tfg-db.sql                     >> ./logs/postgres_logs.log
sleep 10

echo "Installing headless chromium"
mkdir -p ./logs
cd "../backoffice"
mkdir -p ./logs
echo "  - Installing dependencies..." &&  sudo apt-get install -y libappindicator1 fonts-liberation > ./logs/chromium_logs.log
echo "  - Installing dependencies..." &&  sudo apt-get install -f >> ./logs/chromium_logs.log
echo "  - Downloading headless Chromium" && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb >> ./logs/chromium_logs.log
echo "  - Installing headless Chromium" && sudo dpkg -i google-chrome*.deb >> ./logs/chromium_logs.log
