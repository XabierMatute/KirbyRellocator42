#!/bin/bash

# Navigate to the home directory
cd $HOME

# Find the heaviest directory in the home directory
heaviest_dir=$(du -sh .[^.]* * 2>/dev/null | sort -rh | head -n 1)

dir_name=$(echo $heaviest_dir | awk '{print $2}')
dir_size=$(echo $heaviest_dir | awk '{print $1}')

# Print the heaviest directory and its size
echo "The heaviest directory in $HOME is:"
echo "$dir_name ($dir_size)"

sgoinfre_dir="/sgoinfre/students/$USER/$dir_name"

# Ask the user if they want to relocate the heaviest directory
read -p "Do you want to relocate this directory to $sgoinfre_dir? (y/n): " answer

# If the user answers 'y', call the realocate.sh script
if [ "$answer" == "y" ]; then
    # Extract the directory name from the heaviest_dir variable
    echo "Relocating $dir_name to $sgoinfre_dir..."
    KirbyRelocator42/realocate.sh "$dir_name" $sgoinfre_dir
else
    echo "Up2U!"
fi