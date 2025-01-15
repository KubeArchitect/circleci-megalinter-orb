#!/bin/bash        
set -eo pipefail
if [ ! -f /entrypoint.sh ]; then
    echo "Error: MegaLinter entrypoint script not found"
    exit 1
fi
/entrypoint.sh