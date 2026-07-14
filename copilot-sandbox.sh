#!/bin/bash

# Get project directory from first argument, default to current directory
PROJECT_DIR="${1:-.}"

# Resolve to absolute path
PROJECT_PATH="$(realpath "$PROJECT_DIR")"

# Check if project directory exists
if [ ! -d "$PROJECT_PATH" ]; then
	echo "Error: Directory $PROJECT_PATH does not exist"
	exit 1
fi

echo "=========================================="
echo "Launching Copilot sandbox container"
echo "Project: $PROJECT_PATH"
echo "=========================================="
echo ""
echo "Inside the container, run 'copilot' to open the CLI."
echo ""

# Run the container
docker run --rm -it \
	--hostname copilot-sandbox \
	--cap-drop ALL \
	--cap-add CAP_NET_RAW \
	--security-opt no-new-privileges \
	-v "$PROJECT_PATH":/workspace:rw \
	-v copilot-sandbox-root:/root \
	$USER/copilot-sandbox:latest \
	bash
