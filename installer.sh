#!/bin/sh
# installer

# Ensure ~/bin directory exists
mkdir -p ~/bin

# Copy scripts to ~/bin
cp kirby.sh ~/bin/kirby42
cp relocate.sh ~/bin/kirby_relocate
cp restore.sh ~/bin/kirby_restore

# Make scripts executable
chmod +x ~/bin/kirby42
chmod +x ~/bin/kirby_relocate
chmod +x ~/bin/kirby_restore

# Ensure ~/bin is in the PATH
if ! grep -q 'export PATH=$HOME/bin:$PATH' ~/.bashrc; then
    echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
fi

if ! grep -q 'export PATH=$HOME/bin:$PATH' ~/.zshrc; then
    echo 'export PATH=$HOME/bin:$PATH' >> ~/.zshrc
fi

echo -e "\nInstallation complete.\033[0m"
