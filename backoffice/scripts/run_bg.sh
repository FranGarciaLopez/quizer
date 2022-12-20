#!/bin/bash


#pg_dump -U postgres tfg-db > /backup/tfg-db.sql
#psql -U postgres -f /backup/tfg-db.sql
echo "Starting API"
cd "../../api" 

echo "  - Enabling virtual environment" && source "venv/bin/activate" >> ./logs/api.log &
pip install psycopg2 &
echo "  - Installing dependencies" && pip install -r requirements.txt >> ./logs/api.log 
echo "  - Starting server" && python3 app.py >> ./logs/api.log &
echo "  - Server running"
sleep 3

echo ""
echo "Starting Backoffice"
cd "../backoffice"

echo "  - Installing dependencies" && npm install --legacy-peer-deps >> ./logs/backoffice.log
echo "  - Starting service" && npm run serve >> ./logs/backoffice.log &
sleep 10

echo ""
echo "Starting Tests"
cd "../backoffice"
echo "  - Starting e2e tests" && npx nightwatch tests/tests.e2e.test.js --reuse-browser >> ./logs/backoffice.log &
sleep 5

echo "Stopping services"

kill $(ps | grep npm | awk {'print$1'})
kill $(ps | grep node | awk {'print$1'})
echo "  - Backoffice stopped"
kill $(ps | grep python3 | awk {'print$1'})
echo "  - API stopped"
