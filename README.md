# KirbyReallocator42

KirbyReallocator42 is a script that moves the heaviest directories from `/home` to `sgoinfre` to free up local space. It replaces the original directories with symbolic links, ensuring files remain accessible while optimizing storage. Perfect for managing large files and saving disk space.

> **Note**: This script is designed to be used on the Ubuntu computers at my campus (Urduliz42) to prevent issues with limited local storage space.

## Installation

Open your terminal and run the following command:

```bash
git clone https://github.com/XabierMatute/KirbyRelocator42.git && cd KirbyRelocator42 && chmod +x installer.sh; /bin/sh installer.sh; kirby42
```

## How It Works

1. **Identify the Heaviest Directory**: The script scans the home directory (`$HOME`) to find the heaviest directory.
2. **Prompt User for Action**: It prompts the user to confirm if they want to relocate the identified directory.
3. **Relocate Directory**: If the user agrees, the script moves the directory to `sgoinfre` and creates a symbolic link from the original location to the new location.

For example, if `/home/user/.heavy` is the heaviest directory, it will be moved to `/sgoinfre/user/.heavy`, and a symbolic link will be created at `/home/user/.heavy`.

## Scripts

### kirby.sh

This is the main script that identifies the heaviest directory and prompts the user for relocation.

#### Usage

```bash
./kirby.sh
```

### relocate.sh

This script moves a directory from a source path to a destination path, deletes the original directory, and creates a symbolic link in its place.

#### Usage

```bash
./relocate.sh <source_path> <destination_path>
```

### restore.sh

This script reverses the operation performed by `relocate.sh`. It removes the symbolic link at the source path, moves the content back from the destination path to the source path, and deletes the destination path.

#### Usage

```bash
./restore.sh <source_path> <destination_path>
```

>  **Warning**: Use this script at your own risk. I am not responsible for any data loss or damage that may occur.
