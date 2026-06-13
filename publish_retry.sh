#!/bin/bash

# publish_retry.sh - Publish all packages in mcp-packages with retry logic
# Author: Claude
# Date: 2026-02-27

set -e

# Configuration
PACKAGES_DIR="/sessions/beautiful-ecstatic-darwin/mnt/nicholas/CSOAI-CORP/mcp-packages"
LOG_FILE="${PACKAGES_DIR}/publish_retry_log.txt"
RESULTS_FILE="${PACKAGES_DIR}/publish_retry_results.json"
DELAY_BETWEEN_PACKAGES=5
RATE_LIMIT_DELAY=60
MAX_RETRIES=3

# Color codes for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Initialize log files
: > "$LOG_FILE"

# Function to log messages
log_message() {
    local level=$1
    shift
    local message="$@"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[${timestamp}] [${level}] ${message}" | tee -a "$LOG_FILE"
}

# Function to print colored output to console
print_status() {
    local status=$1
    local message=$2
    case $status in
        success)
            echo -e "${GREEN}✓${NC} ${message}"
            ;;
        error)
            echo -e "${RED}✗${NC} ${message}"
            ;;
        warning)
            echo -e "${YELLOW}⚠${NC} ${message}"
            ;;
        info)
            echo -e "${BLUE}ℹ${NC} ${message}"
            ;;
    esac
}

# Check npm authentication
log_message "INFO" "Checking npm authentication..."
if npm whoami > /dev/null 2>&1; then
    current_user=$(npm whoami)
    print_status "success" "npm authenticated as: ${current_user}"
    log_message "INFO" "npm authenticated as: ${current_user}"
else
    print_status "error" "npm is not authenticated. Please run 'npm login' first."
    log_message "ERROR" "npm is not authenticated"
    exit 1
fi

# Initialize results JSON
cat > "$RESULTS_FILE" << 'JSONEOF'
{
  "timestamp": "",
  "total_packages": 0,
  "published": 0,
  "skipped_already_published": 0,
  "failed": 0,
  "packages": []
}
JSONEOF

# Get all package directories
print_status "info" "Scanning for packages in ${PACKAGES_DIR}..."
log_message "INFO" "Scanning for packages in ${PACKAGES_DIR}"

# Find all package.json files (one level deep from PACKAGES_DIR)
package_dirs=()
while IFS= read -r pkg_json; do
    pkg_dir=$(dirname "$pkg_json")
    if [ -f "$pkg_dir/package.json" ]; then
        package_dirs+=("$pkg_dir")
    fi
done < <(find "$PACKAGES_DIR" -maxdepth 2 -name "package.json" -type f ! -path "$PACKAGES_DIR/node_modules/*")

total_packages=${#package_dirs[@]}
print_status "info" "Found ${total_packages} packages"
log_message "INFO" "Found ${total_packages} packages"

# Initialize counters
published_count=0
skipped_count=0
failed_count=0
failed_packages=()

# Array to store JSON results
declare -a json_results

# Process each package
for i in "${!package_dirs[@]}"; do
    pkg_dir="${package_dirs[$i]}"
    pkg_index=$((i + 1))
    
    # Extract package name from package.json
    pkg_name=$(grep -o '"name"[[:space:]]*:[[:space:]]*"[^"]*"' "$pkg_dir/package.json" | cut -d'"' -f4)
    
    if [ -z "$pkg_name" ]; then
        print_status "warning" "[${pkg_index}/${total_packages}] Skipping ${pkg_dir##*/} - no package name found"
        log_message "WARN" "Skipping ${pkg_dir} - no package name found"
        continue
    fi
    
    # Extract just the scope and package name (without the @csgaglobal/ prefix if present)
    if [[ "$pkg_name" == @* ]]; then
        check_name="$pkg_name"
    else
        check_name="@csgaglobal/${pkg_name}"
    fi
    
    print_status "info" "[${pkg_index}/${total_packages}] Processing: ${pkg_name}..."
    log_message "INFO" "Processing package: ${pkg_name} from ${pkg_dir}"
    
    # Check if already published
    if npm view "$check_name" version > /dev/null 2>&1; then
        version=$(npm view "$check_name" version 2>/dev/null)
        print_status "warning" "[${pkg_index}/${total_packages}] Already published (v${version}): ${pkg_name}"
        log_message "WARN" "Package already published with version ${version}: ${pkg_name}"
        json_results+=("{\"package\": \"${pkg_name}\", \"status\": \"skipped\", \"reason\": \"already_published\", \"version\": \"${version}\"}")
        ((skipped_count++))
    else
        # Package not published, attempt to publish
        print_status "info" "[${pkg_index}/${total_packages}] Publishing: ${pkg_name}..."
        log_message "INFO" "Attempting to publish: ${pkg_name}"
        
        retry_count=0
        publish_success=false
        publish_error=""
        
        while [ $retry_count -lt $((MAX_RETRIES + 1)) ]; do
            if [ $retry_count -gt 0 ]; then
                print_status "info" "Retry ${retry_count}/${MAX_RETRIES} for ${pkg_name}..."
                log_message "INFO" "Retry ${retry_count}/${MAX_RETRIES} for ${pkg_name}"
                sleep $RATE_LIMIT_DELAY
            fi
            
            # Attempt publish
            if output=$(cd "$pkg_dir" && npm publish --access public 2>&1); then
                print_status "success" "[${pkg_index}/${total_packages}] Published: ${pkg_name}"
                log_message "INFO" "Successfully published: ${pkg_name}"
                json_results+=("{\"package\": \"${pkg_name}\", \"status\": \"published\"}")
                publish_success=true
                ((published_count++))
                break
            else
                publish_error="$output"
                # Check if it's a rate limit error
                if echo "$publish_error" | grep -q "E429"; then
                    if [ $retry_count -lt $MAX_RETRIES ]; then
                        print_status "warning" "[${pkg_index}/${total_packages}] Rate limited (E429), will retry..."
                        log_message "WARN" "Rate limited for ${pkg_name}, retrying..."
                        ((retry_count++))
                    else
                        print_status "error" "[${pkg_index}/${total_packages}] Failed after ${MAX_RETRIES} retries (E429): ${pkg_name}"
                        log_message "ERROR" "Failed to publish ${pkg_name} after ${MAX_RETRIES} retries due to E429: ${publish_error}"
                        json_results+=("{\"package\": \"${pkg_name}\", \"status\": \"failed\", \"reason\": \"rate_limited_max_retries\", \"error\": \"E429\"}")
                        failed_packages+=("${pkg_name}")
                        ((failed_count++))
                        break
                    fi
                else
                    # Other error
                    print_status "error" "[${pkg_index}/${total_packages}] Failed: ${pkg_name}"
                    log_message "ERROR" "Failed to publish ${pkg_name}: ${publish_error}"
                    json_results+=("{\"package\": \"${pkg_name}\", \"status\": \"failed\", \"reason\": \"other_error\", \"error\": \"${publish_error:0:100}\"}")
                    failed_packages+=("${pkg_name}")
                    ((failed_count++))
                    break
                fi
            fi
        done
    fi
    
    # Delay between packages (except for last one)
    if [ $((pkg_index)) -lt $total_packages ]; then
        sleep $DELAY_BETWEEN_PACKAGES
    fi
done

# Generate JSON summary
echo "Generating results summary..."
log_message "INFO" "Generating results summary"

# Build JSON results array
json_array="["
for i in "${!json_results[@]}"; do
    json_array+="${json_results[$i]}"
    if [ $i -lt $((${#json_results[@]} - 1)) ]; then
        json_array+=","
    fi
done
json_array+="]"

# Create final JSON with summary
current_timestamp=$(date -u '+%Y-%m-%dT%H:%M:%SZ')
cat > "$RESULTS_FILE" << JSONEOF
{
  "timestamp": "${current_timestamp}",
  "total_packages": ${total_packages},
  "published": ${published_count},
  "skipped_already_published": ${skipped_count},
  "failed": ${failed_count},
  "packages": ${json_array}
}
JSONEOF

# Print summary
echo ""
print_status "info" "========== PUBLISHING SUMMARY =========="
echo "Total packages: ${total_packages}"
print_status "success" "Published: ${published_count}"
print_status "warning" "Skipped (already published): ${skipped_count}"
print_status "error" "Failed: ${failed_count}"

if [ $failed_count -gt 0 ]; then
    echo ""
    print_status "error" "Failed packages:"
    for pkg in "${failed_packages[@]}"; do
        echo "  - ${pkg}"
    done
fi

echo ""
print_status "info" "Results written to:"
echo "  Log: ${LOG_FILE}"
echo "  JSON: ${RESULTS_FILE}"

log_message "INFO" "Publishing complete. Published: ${published_count}, Skipped: ${skipped_count}, Failed: ${failed_count}"

# Exit with appropriate code
if [ $failed_count -gt 0 ]; then
    exit 1
else
    exit 0
fi
