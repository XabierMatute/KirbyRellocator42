#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_path> <destination_path>"
    exit 1
fi

SOURCE_PATH=$1
DESTINATION_PATH=$2

# Check if the source path exists
if [ ! -e "$SOURCE_PATH" ]; then
    echo "Error: Source path '$SOURCE_PATH' does not exist."
    exit 1
fi

# Move the source to the destination
echo "Moving '$SOURCE_PATH' to '$DESTINATION_PATH'... This might take a while if the file is large."
mv "$SOURCE_PATH" "$DESTINATION_PATH"

# Create a symbolic link at the original source path pointing to the new destination
echo "Creating a symlink at '$SOURCE_PATH' pointing to '$DESTINATION_PATH'..."
ln -s "$DESTINATION_PATH" "$SOURCE_PATH"

echo "Moved '$SOURCE_PATH' to '$DESTINATION_PATH' and created a symlink at '$SOURCE_PATH' pointing to '$DESTINATION_PATH'."