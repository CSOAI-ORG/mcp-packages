#!/bin/bash
# Publish all 47 @csgaglobal MCP packages to npm
# Run from: cd ~/CSOAI-CORP/mcp-packages && bash publish.sh

PACKAGES=(
  ai-governance aws-cloud brave-search cloud-security compliance-audit
  context7-docs csv-analytics data-classification docker-compose dsrb-defence
  fetch-http filesystem-ops git-operations github-api gitlab-api
  google-drive incident-response json-transformer linear-issues memory-graph
  notion-workspace playwright-browser pmcp-gateway policy-engine postgres-db
  puppeteer-headless quantranet-pqc real-estate-ai red-team-ops retail-ai
  secure-comms sentry-monitoring sequential-thinking slack-messaging smart-cities-ai
  space-ai sports-analytics-ai sqlite-db supply-chain-ai telecom-ai
  terranova-defence thn-global threat-intelligence time-zones travel-hospitality-ai
  vercel-deploy vulnerability-scanner
)

SUCCESS=0
FAILED=0
SKIPPED=0

for pkg in "${PACKAGES[@]}"; do
  echo -n "[$((SUCCESS+FAILED+SKIPPED+1))/47] @csgaglobal/$pkg... "

  OUTPUT=$(cd "$pkg" && npm publish --access public 2>&1)
  EXIT=$?

  if [ $EXIT -eq 0 ]; then
    echo "✅"
    SUCCESS=$((SUCCESS+1))
  elif echo "$OUTPUT" | grep -q "already been published\|cannot publish over"; then
    echo "⏭️  already exists"
    SKIPPED=$((SKIPPED+1))
  else
    echo "❌"
    echo "  Error: $(echo "$OUTPUT" | grep 'npm error' | head -1)"
    FAILED=$((FAILED+1))
  fi

  sleep 2
done

echo ""
echo "============================"
echo "✅ Published: $SUCCESS"
echo "⏭️  Skipped:  $SKIPPED"
echo "❌ Failed:    $FAILED"
echo "============================"
