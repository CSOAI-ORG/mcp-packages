#!/bin/bash
# Publish all @csgaglobal MCP server packages to npm
# Run from the mcp-packages directory

set -e

FAILED=""
SUCCESS=0
SKIPPED=0

echo "\n📦 Publishing @csgaglobal/ai-governance..."
cd "ai-governance" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: ai-governance"; FAILED="$FAILED ai-governance"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/aws-cloud..."
cd "aws-cloud" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: aws-cloud"; FAILED="$FAILED aws-cloud"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/brave-search..."
cd "brave-search" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: brave-search"; FAILED="$FAILED brave-search"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/cloud-security..."
cd "cloud-security" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: cloud-security"; FAILED="$FAILED cloud-security"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/compliance-audit..."
cd "compliance-audit" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: compliance-audit"; FAILED="$FAILED compliance-audit"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/context7-docs..."
cd "context7-docs" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: context7-docs"; FAILED="$FAILED context7-docs"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/csv-analytics..."
cd "csv-analytics" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: csv-analytics"; FAILED="$FAILED csv-analytics"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/data-classification..."
cd "data-classification" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: data-classification"; FAILED="$FAILED data-classification"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/docker-compose..."
cd "docker-compose" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: docker-compose"; FAILED="$FAILED docker-compose"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/dsrb-defence..."
cd "dsrb-defence" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: dsrb-defence"; FAILED="$FAILED dsrb-defence"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/fetch-http..."
cd "fetch-http" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: fetch-http"; FAILED="$FAILED fetch-http"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/filesystem-ops..."
cd "filesystem-ops" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: filesystem-ops"; FAILED="$FAILED filesystem-ops"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/git-operations..."
cd "git-operations" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: git-operations"; FAILED="$FAILED git-operations"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/github-api..."
cd "github-api" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: github-api"; FAILED="$FAILED github-api"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/gitlab-api..."
cd "gitlab-api" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: gitlab-api"; FAILED="$FAILED gitlab-api"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/google-drive..."
cd "google-drive" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: google-drive"; FAILED="$FAILED google-drive"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/incident-response..."
cd "incident-response" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: incident-response"; FAILED="$FAILED incident-response"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/json-transformer..."
cd "json-transformer" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: json-transformer"; FAILED="$FAILED json-transformer"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/linear-issues..."
cd "linear-issues" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: linear-issues"; FAILED="$FAILED linear-issues"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/memory-graph..."
cd "memory-graph" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: memory-graph"; FAILED="$FAILED memory-graph"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/notion-workspace..."
cd "notion-workspace" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: notion-workspace"; FAILED="$FAILED notion-workspace"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/playwright-browser..."
cd "playwright-browser" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: playwright-browser"; FAILED="$FAILED playwright-browser"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/pmcp-gateway..."
cd "pmcp-gateway" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: pmcp-gateway"; FAILED="$FAILED pmcp-gateway"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/policy-engine..."
cd "policy-engine" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: policy-engine"; FAILED="$FAILED policy-engine"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/postgres-db..."
cd "postgres-db" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: postgres-db"; FAILED="$FAILED postgres-db"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/puppeteer-headless..."
cd "puppeteer-headless" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: puppeteer-headless"; FAILED="$FAILED puppeteer-headless"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/quantranet-pqc..."
cd "quantranet-pqc" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: quantranet-pqc"; FAILED="$FAILED quantranet-pqc"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/real-estate-ai..."
cd "real-estate-ai" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: real-estate-ai"; FAILED="$FAILED real-estate-ai"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/red-team-ops..."
cd "red-team-ops" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: red-team-ops"; FAILED="$FAILED red-team-ops"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/retail-ai..."
cd "retail-ai" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: retail-ai"; FAILED="$FAILED retail-ai"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/secure-comms..."
cd "secure-comms" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: secure-comms"; FAILED="$FAILED secure-comms"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/sentry-monitoring..."
cd "sentry-monitoring" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: sentry-monitoring"; FAILED="$FAILED sentry-monitoring"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/sequential-thinking..."
cd "sequential-thinking" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: sequential-thinking"; FAILED="$FAILED sequential-thinking"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/slack-messaging..."
cd "slack-messaging" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: slack-messaging"; FAILED="$FAILED slack-messaging"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/smart-cities-ai..."
cd "smart-cities-ai" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: smart-cities-ai"; FAILED="$FAILED smart-cities-ai"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/space-ai..."
cd "space-ai" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: space-ai"; FAILED="$FAILED space-ai"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/sports-analytics-ai..."
cd "sports-analytics-ai" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: sports-analytics-ai"; FAILED="$FAILED sports-analytics-ai"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/sqlite-db..."
cd "sqlite-db" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: sqlite-db"; FAILED="$FAILED sqlite-db"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/supply-chain-ai..."
cd "supply-chain-ai" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: supply-chain-ai"; FAILED="$FAILED supply-chain-ai"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/telecom-ai..."
cd "telecom-ai" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: telecom-ai"; FAILED="$FAILED telecom-ai"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/terranova-defence..."
cd "terranova-defence" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: terranova-defence"; FAILED="$FAILED terranova-defence"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/thn-global..."
cd "thn-global" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: thn-global"; FAILED="$FAILED thn-global"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/threat-intelligence..."
cd "threat-intelligence" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: threat-intelligence"; FAILED="$FAILED threat-intelligence"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/time-zones..."
cd "time-zones" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: time-zones"; FAILED="$FAILED time-zones"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/travel-hospitality-ai..."
cd "travel-hospitality-ai" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: travel-hospitality-ai"; FAILED="$FAILED travel-hospitality-ai"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/vercel-deploy..."
cd "vercel-deploy" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: vercel-deploy"; FAILED="$FAILED vercel-deploy"; } && cd ..
sleep 3

echo "\n📦 Publishing @csgaglobal/vulnerability-scanner..."
cd "vulnerability-scanner" && npm publish --access public 2>&1 && SUCCESS=$((SUCCESS+1)) || { echo "⚠️  Failed: vulnerability-scanner"; FAILED="$FAILED vulnerability-scanner"; } && cd ..
sleep 3

echo "\n============================"
echo "✅ Published: $SUCCESS packages"
if [ -n "$FAILED" ]; then
  echo "❌ Failed:$FAILED"
fi
echo "============================"
