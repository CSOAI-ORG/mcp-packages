#!/usr/bin/env python3
"""Publish all @csgaglobal MCP packages to npm with logging."""
import os
import subprocess
import time
import json

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
LOG_FILE = os.path.join(BASE_DIR, "publish_log.txt")
NPM_TOKEN = os.environ.get("NPM_TOKEN", "")
if not NPM_TOKEN:
    raise RuntimeError("NPM_TOKEN environment variable is required")

# Get all package directories
packages = sorted([
    d for d in os.listdir(BASE_DIR)
    if os.path.isdir(os.path.join(BASE_DIR, d)) and
    os.path.exists(os.path.join(BASE_DIR, d, "package.json"))
])

results = {"success": [], "failed": [], "skipped": []}

with open(LOG_FILE, "w") as log:
    log.write(f"Publishing {len(packages)} packages to npm\n")
    log.write("=" * 50 + "\n\n")

    # Set up npm auth
    npmrc_path = os.path.expanduser("~/.npmrc")
    with open(npmrc_path, "w") as f:
        f.write(f"//registry.npmjs.org/:_authToken={NPM_TOKEN}\n")
    log.write("npm auth configured\n\n")

    for i, pkg in enumerate(packages):
        pkg_dir = os.path.join(BASE_DIR, pkg)
        pkg_json_path = os.path.join(pkg_dir, "package.json")

        with open(pkg_json_path) as f:
            pkg_data = json.load(f)
        pkg_name = pkg_data.get("name", f"@csgaglobal/{pkg}")

        log.write(f"[{i+1}/{len(packages)}] {pkg_name}... ")
        log.flush()

        try:
            result = subprocess.run(
                ["npm", "publish", "--access", "public"],
                cwd=pkg_dir,
                capture_output=True,
                text=True,
                timeout=60
            )
            if result.returncode == 0:
                results["success"].append(pkg_name)
                log.write("✅ SUCCESS\n")
            elif "already been published" in result.stderr or "cannot publish over" in result.stderr:
                results["skipped"].append(pkg_name)
                log.write("⏭️  SKIPPED (already published)\n")
            elif "429" in result.stderr or "Too Many" in result.stderr:
                results["failed"].append(pkg_name)
                log.write(f"⚠️  RATE LIMITED - waiting 30s\n")
                log.flush()
                time.sleep(30)
                # Retry once
                result2 = subprocess.run(
                    ["npm", "publish", "--access", "public"],
                    cwd=pkg_dir,
                    capture_output=True,
                    text=True,
                    timeout=60
                )
                if result2.returncode == 0:
                    results["failed"].remove(pkg_name)
                    results["success"].append(pkg_name)
                    log.write(f"    Retry: ✅ SUCCESS\n")
                else:
                    log.write(f"    Retry: ❌ FAILED - {result2.stderr[:200]}\n")
            else:
                results["failed"].append(pkg_name)
                log.write(f"❌ FAILED - {result.stderr[:200]}\n")
        except subprocess.TimeoutExpired:
            results["failed"].append(pkg_name)
            log.write("❌ TIMEOUT\n")
        except Exception as e:
            results["failed"].append(pkg_name)
            log.write(f"❌ ERROR - {str(e)[:200]}\n")

        log.flush()

        # Rate limit delay - 2 seconds between publishes
        if i < len(packages) - 1:
            time.sleep(2)

    log.write("\n" + "=" * 50 + "\n")
    log.write(f"RESULTS:\n")
    log.write(f"  ✅ Published: {len(results['success'])}\n")
    log.write(f"  ⏭️  Skipped:  {len(results['skipped'])}\n")
    log.write(f"  ❌ Failed:    {len(results['failed'])}\n")
    if results["failed"]:
        log.write(f"\nFailed packages:\n")
        for p in results["failed"]:
            log.write(f"  - {p}\n")
    log.write("\n")

# Also write a JSON summary
summary_path = os.path.join(BASE_DIR, "publish_results.json")
with open(summary_path, "w") as f:
    json.dump(results, f, indent=2)

print("Done")
