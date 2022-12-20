#!/bin/bash

echo "Starting API"
cd "../../api"
mkdir -p ./logs
echo "  - Enabling virtual environment" && source "venv/bin/activate" > ./logs/api.log
echo "  - Installing dependencies" && pip install -r requirements.txt  >> ./logs/api.log
echo "  - Starting server" && python3 app.py >> ./logs/api.log &
echo "  - Server running"
sleep 10

echo ""
echo "Starting Backoffice"
cd "../backoffice"
mkdir -p ./logs
echo "  - Installing vue-cli-service" && npm install -g @vue/cli-service > ./logs/backoffice.log
echo "  - Installing dependencies" && npm install --legacy-peer-deps >> ./logs/backoffice.log
echo "  - Starting service" && npm run serve >> ./logs/backoffice.log &
sleep 10


echo "Stopping services"

kill $(ps | grep npm | awk {'print$1'})
kill $(ps | grep node | awk {'print$1'})
echo "  - Backoffice stopped"
kill $(ps | grep python3 | awk {'print$1'})
echo "  - API stopped"
