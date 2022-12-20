#!/bin/bash
#pg_dump -U postgres tfg-db > /backup/tfg-db.sql
#psql -U postgres -f /backup/tfg-db.sql
echo "Starting API"
cd "../../api" 

echo "  - Enabling virtual environment" && source "venv/bin/activate" &
echo "  - Installing dependencies" && pip install -r requirements.txt &
echo "  - Intalling psycopg2" && pip install psycopg2 &
echo "  - Starting server" && python3 app.py &
echo "  - Server running"
sleep 10

echo ""
echo "Starting Backoffice"
cd "../backoffice"

echo "  - Installing dependencies" && npm install --legacy-peer-deps &
echo "  - Starting service" && npm run serve &
sleep 10


echo "Stopping services"

kill $(ps | grep npm | awk {'print$1'})
kill $(ps | grep node | awk {'print$1'})
echo "  - Backoffice stopped"
kill $(ps | grep python3 | awk {'print$1'})
echo "  - API stopped"
