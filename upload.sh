#!/bin/bash

# Change to the Source Directory
cd $SYNC_PATH

# Display a message
echo "============================"
echo "Uploading the Build..."
echo "============================"

# Change to the Output Directory
cd out/target/product/${DEVICE}

# List the Files
echo "Files inside ${SYNC_PATH}/out/target/product/${DEVICE} are:"
ls --color=auto

# Set FILENAME var
FILENAME=$(echo $OUTPUT)

# Upload to oshi.at
if [ -z "$TIMEOUT" ];then
    TIMEOUT=20160
fi

curl -T $FILENAME https://oshi.at/${FILENAME}/${TIMEOUT} | tee link.txt > /dev/null || { echo "ERROR: Failed to Upload the Build!" && exit 1; }

# Show the Download Link
echo "=============================================="
cat link.txt || { echo "ERROR: Failed to Upload the Build!" && exit 1; }
echo "=============================================="

# Exit
exit 0
