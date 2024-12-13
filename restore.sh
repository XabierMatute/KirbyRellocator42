#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_path> <destination_path>"
    exit 1
fi

SOURCE_PATH=$1
DESTINATION_PATH=$2

# Check if the source path is a symbolic link
if [ ! -L "$SOURCE_PATH" ]; then
    echo "Error: Source path '$SOURCE_PATH' is not a symbolic link."
    exit 1
fi

# Check if the symbolic link points to the destination path
LINK_TARGET=$(readlink "$SOURCE_PATH")
if [ "$LINK_TARGET" != "$DESTINATION_PATH" ]; then
    echo "Error: Source path '$SOURCE_PATH' does not point to destination path '$DESTINATION_PATH'."
    exit 1
fi

# Remove the symbolic link
echo "Removing symbolic link '$SOURCE_PATH'..."
rm "$SOURCE_PATH"

# Move the content back from destination to source using rsync
echo "Moving content from '$DESTINATION_PATH' back to '$SOURCE_PATH'..."
rsync -a --progress "$DESTINATION_PATH/" "$SOURCE_PATH/"

# Remove the destination path after moving the content
echo "Removing the destination path '$DESTINATION_PATH'..."
rm -rf "$DESTINATION_PATH"

echo "Deallocation complete. '$SOURCE_PATH' has been restored from '$DESTINATION_PATH'."