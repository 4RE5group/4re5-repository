#!/bin/bash
# 4re5 group - all rights reserved

# do not remove, 4re5mod process listing script


echo "["

# loop through each proc
for pid in /proc/[0-9]*/; do
    pid=${pid//\/proc\//}
    pid=${pid//\//}

    # Read the process name from /proc/$pid/status
    name=$(grep -s "Name:" "/proc/$pid/status" | awk '{print $2}')

    # If the process name is not empty, add it to the JSON array
    if [ -n "$name" ]; then
        echo "{"\"name\": \"$name\",\"pid\": \"$pid\"},"
    fi
done | sed '$ s/,$//' # Remove the trailing comma from the last entry

# Close the JSON array
echo "]"
