#!/bin/bash
#pg_dump -U postgres tfg-db > /backup/tfg-db.sql
#psql -U postgres -f /backup/tfg-db.sql
echo "Starting API"
cd "../../api" 
mkdir ./logs
echo "  - Enabling virtual environment" && source "venv/bin/activate" > ./logs/api_logs.log &
echo "  - Installing dependencies" && pip install -r requirements.txt  >> ./logs/api_logs.log &
echo "  - Intalling psycopg2" && pip install psycopg2 >> ./logs/api_logs.log &
sleep 5
echo "  - Starting server" && python3 app.py >> ./logs/api_logs.log &
echo "  - Server running"
sleep 10

echo ""
echo "Starting Backoffice"
cd "../backoffice"
mkdir ./logs

echo "  - Installing dependencies" && npm install --legacy-peer-deps > ./logs/backoffice.log &
echo "  - Starting service" && npm run serve >> ./logs/backoffice.log &
sleep 10


echo "Stopping services"

kill $(ps | grep npm | awk {'print$1'})
kill $(ps | grep node | awk {'print$1'})
echo "  - Backoffice stopped"
kill $(ps | grep python3 | awk {'print$1'})
echo "  - API stopped"
