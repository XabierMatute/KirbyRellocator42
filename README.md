# KirbyRelocator42

KirbyMover42 is a script that moves the heaviest directories from `/home` to `sgoinfre` to free up local space. It replaces the original directories with symbolic links, ensuring files remain accessible while optimizing storage. Perfect for managing large files and saving disk space.

## Installation

1. Open your terminal and run the following command:

    ```bash
    git clone https://github.com/XabierMatute/KirbyRelocator42.git && cd KirbyRelocator42 && chmod +x installer.sh; /bin/sh installer.sh
    ```

2. Restart your terminal or open a new one:

## How It Works

1. **Identify the Heaviest Directory**: The script scans the home directory (`$HOME`) to find the heaviest directory.
2. **Prompt User for Action**: It prompts the user to confirm if they want to relocate the identified directory.
3. **Relocate Directory**: If the user agrees, the script moves the directory to `sgoinfre` and creates a symbolic link from the original location to the new location.

## Scripts

### kirby.sh

This is the main script that identifies the heaviest directory and prompts the user for relocation.

#### Usage

```bash
./kirby.sh