#!/bin/bash        
set -eo pipefail
# Allow configurable entrypoint path
MEGALINTER_ENTRYPOINT="${MEGALINTER_ENTRYPOINT}"

# Validate entrypoint
if [ ! -f "${MEGALINTER_ENTRYPOINT}" ]; then
    echo "Error: MegaLinter entrypoint script not found at: ${MEGALINTER_ENTRYPOINT}"
    exit 1
fi

# Validate permissions
if [ ! -x "${MEGALINTER_ENTRYPOINT}" ]; then
    echo "Error: MegaLinter entrypoint script is not executable"
    exit 1
fi

# Execute with logging
echo "Executing MegaLinter entrypoint script..."
exec "${MEGALINTER_ENTRYPOINT}"