#!/bin/bash

echo "Starting AI Automation Stack..."

docker-compose down
docker-compose up --build -d

echo "Waiting for container to start..."

sleep 5

echo "--------------------------------------"
echo "Simulating Wazuh Custom Rule 110001"
echo "--------------------------------------"

curl -s -X POST http://localhost:5000/alert \
-H "Content-Type: application/json" \
-d '{"rule_id":"777111","description":"Windows account created"}'

echo ""
sleep 2

echo ""
echo "--------------------------------------"
echo "Simulating Multiple Failed Logins"
echo "--------------------------------------"

curl -s -X POST http://localhost:5000/alert \
-H "Content-Type: application/json" \
-d '{"rule_id":"777222","description":"Multiple failed login attempts"}'

echo ""
sleep 2

echo ""
echo "--------------------------------------"
echo "Check remediation log:"
echo "--------------------------------------"

docker exec automation cat /app/remediation.log

echo ""
echo "-------------------------------------------"
echo "Demo Completed Successfully"
echo "--------------------------------------"
