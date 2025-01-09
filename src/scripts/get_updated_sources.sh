#!/bin/bash
ITEMS=""
for item in "${PARAM_UPD_SRC_FILES}"/*; do
    if [ -e "$item" ]; then
        ITEMS="${ITEMS} $(basename "$item")"
    fi
done
echo "Items in $PARAM_UPD_SRC_FILES: $ITEMS"
if [ -z "$ITEMS" ]; then
    echo "No updated sources found"
    exit 0
else
    echo "Updated sources found. Copying files to the repository"
    cp -a "${PARAM_UPD_SRC_FILES}/." .
fi
