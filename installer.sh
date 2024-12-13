#!/bin/sh
# installer

chmod +x kirby.sh
chmod +x realocate.sh

script_path=$(pwd)/kirby.sh

alias="alias kirby42='bin/bash $script_path'"

alias >> ~/.$(basename "$SHELL")rc

script_path=$(pwd)/realocate.sh

alias="alias kirby_realocate='bin/bash $script_path'"

alias >> ~/.$(basename "$SHELL")rc


echo -e "\nTo use the 'kirby42' , Please restart your terminal then run 'kirby42'\033[0m"