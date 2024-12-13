#!/bin/sh
# installer

# Ensure ~/bin directory exists
mkdir -p ~/bin

# Copy scripts to ~/bin
cp kirby.sh ~/bin/kirby42
cp realocate.sh ~/bin/kirby_realocate
cp deallocate.sh ~/bin/kirby_deallocate

# Make scripts executable
chmod +x ~/bin/kirby42
chmod +x ~/bin/kirby_realocate
chmod +x ~/bin/kirby_deallocate

# Ensure ~/bin is in the PATH
if ! grep -q 'export PATH=$HOME/bin:$PATH' ~/.bashrc; then
    echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
fi

if ! grep -q 'export PATH=$HOME/bin:$PATH' ~/.zshrc; then
    echo 'export PATH=$HOME/bin:$PATH' >> ~/.zshrc
fi

echo -e "\nInstallation complete.\033[0m"
