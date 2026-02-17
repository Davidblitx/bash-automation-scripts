 #!/bin/bash

read -p "Enter directory: " DIRPATH

if [ -d "$DIRPATH" ]; then
    echo "Directory exits: $DIRPATH"
else 
    echo "Directory not found: $DIRPATH"
    exit 1
fi

