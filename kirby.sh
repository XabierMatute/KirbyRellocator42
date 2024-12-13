#!/bin/bash

ascii_art=$(cat << "EOF"
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠶⠦⡄⠀⠀⠀⠀⠀⠀⡴⠀⠀⠀
⠀⢀⣀⠀⠀⠀⣀⠤⠖⠒⠋⡉⠙⢲⣺⢅⡀⠀⠹⡀⠀⠀⠀⢀⡜⠁⠀⠀⠀
⣼⠉⠀⠉⠓⠏⠁⠀⠀⠀⠀⢯⣧⠈⢿⡆⠈⠓⢴⠇⠀⠀⣠⠊⠀⠀⠀⡀⠀
⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠀⡀⠄⠠⢀⠈⢣⡀⠀⠁⠀⢀⡤⠊⠀⠀
⠈⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢀⠎⠀⠀⠀⠘⡇⠀⢧⠀⠐⠊⠁⠀⠀⠀⠀
⠀⢸⠳⣄⠀⠀⠀⠀⠀⠀⠀⠈⢺⠀⠀⠀⠀⠀⡇⠀⢸⠀⠀⠀⠀⢀⣀⣀⡀
⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣆⠠⠄⢀⡀⢇⠀⢸⡀⠀⡀⠀⠀⠀⠀⠀
⠀⠘⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢃⠀⠀⠀⠈⠙⠆⡼⠛⢦⡀⠑⠢⣄⠀⠀
⠀⠀⠹⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⡌⠢⣀⠀⢀⡴⡰⠁⠀⢀⡇⠀⠀⠈⠑⠀
⠀⠀⠀⢸⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠗⠒⠚⠉⠀⠀⠀⠀⠀⠀
⠀⠀⠀⡜⠀⠉⠢⢄⣀⠀⠀⠀⠀⠀⣀⡤⠖⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⡇⠀⠀⠀⠀⣨⠟⠉⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀KirbyRelocator42 by @xmatute-
⠀⠀⠀⠙⠂⠴⠒⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
EOF
)

# Define the color code for pink (magenta)
pink='\033[1;35m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
orange='\033[38;5;214m'
reset='\033[0m'

# Print the ASCII art in pink
echo -e "${pink}${ascii_art}${reset}"
echo

# Navigate to the home directory
cd $HOME

# Find the heaviest directory in the home directory
heaviest_dir=$(du -sh .[^.]* * 2>/dev/null | sort -rh | head -n 1)

dir_name=$(echo $heaviest_dir | awk '{print $2}')/
dir_size=$(echo $heaviest_dir | awk '{print $1}')

# Print the heaviest directory and its size
echo "The heaviest directory in $HOME is:"
echo -e "${orange}${dir_name} (${dir_size})${reset}"

sgoinfre_dir="/sgoinfre/students/$USER"

# Ask the user if they want to relocate the heaviest directory
read -p "Do you want to relocate this directory to $sgoinfre_dir? (y/n): " answer

# If the user answers 'y', call the realocate.sh script
if [ "$answer" == "y" ]; then
    # Extract the directory name from the heaviest_dir variable
    echo "Relocating $dir_name to $sgoinfre_dir..."
    kirby_realocate "$dir_name" "$sgoinfre_dir"
else
    echo -e "${yellow}Up2U :I${reset}"
    exit 0
fi

if [ $? -eq 0 ]; then
    echo -e "${green}Success :)${reset}"
    exit 0
else
    echo -e "${red}Failed :(${reset}"
    exit 1
fi
# End of kirby.sh