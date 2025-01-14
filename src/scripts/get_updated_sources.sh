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
        circleci-agent step halt # Stop the job
else
        echo "Updated sources found. Copying files to the repository"
        if ! cp -a "${PARAM_UPD_SRC_FILES}/." .; then
            echo "Fejl ved kopiering af filer"
            exit 1
        else
                cp -a "${PARAM_UPD_SRC_FILES}/." .
                echo "Files copied successfully"
        fi
fi
