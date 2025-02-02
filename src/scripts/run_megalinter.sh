# Allow configurable entrypoint path
ML_ENTRYPOINT="${MEGALINTER_ENTRYPOINT}"

# Validate entrypoint
if [ ! -f "${ML_ENTRYPOINT}" ]; then
    echo "Error: MegaLinter entrypoint script not found at: ${ML_ENTRYPOINT}"
    exit 1
fi

# Validate permissions
if [ ! -x "${ML_ENTRYPOINT}" ]; then
    echo "Error: MegaLinter entrypoint script is not executable"
    exit 1
fi

# Execute with logging
echo "Executing MegaLinter entrypoint script..."
exec "${ML_ENTRYPOINT}"