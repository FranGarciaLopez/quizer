#!/bin/bash

 
#pg_dump -U postgres tfg-db > /backup/tfg-db.sql
#psql -U postgres -f /backup/tfg-db.sql
echo "Installing postgres on Ubuntu"
cd "../../api" 
mkdir -p ./logs
echo "  - Installing postgres..." &&  sudo apt-get update > ./logs/postgres_logs.log 
echo "  - Installing postgres..." &&  sudo apt install postgresql postgresql-contrib >> ./logs/postgres_logs.log 
echo "  - Updating postgres service" && sudo service postgresql start >> ./logs/postgres_logs.log 
echo "  - Accessing postgres" && sudo -u postgres psql >> ./logs/postgres_logs.log 
echo "  - Creating database backup for tests" && pg_dump -U postgres tfg-db > /backup/tfg-db.sql >> ./logs/postgres_logs.log 
sleep 10

echo "Installing headless chromium"
cd "../backoffice"
mkdir -p ./logs
echo "  - Installing dependencies..." &&  sudo apt-get install -y libappindicator1 fonts-liberation > ./logs/chromium_logs.log 
echo "  - Installing dependencies..." &&  sudo apt-get install -f >> ./logs/chromium_logs.log
echo "  - Downloading headless Chromium" && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb >> ./logs/chromium_logs.log
echo "  - Installing headless Chromium" && sudo dpkg -i google-chrome*.deb >> ./logs/chromium_logs.log


#kill $(ps | grep npm | awk {'print$1'})
#kill $(ps | grep node | awk {'print$1'})
#echo "  - Backoffice stopped"
#kill $(ps | grep python3 | awk {'print$1'})
#echo "  - API stopped"
