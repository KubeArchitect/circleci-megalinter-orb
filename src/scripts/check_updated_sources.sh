#!/bin/bash
if [ ! -d "$PARAM_UPD_SRC_FILES" ]; then
    echo "$PARAM_UPD_SRC_FILES does not exist. Stopping job..."
    circleci-agent step halt # Stop the job
fi
