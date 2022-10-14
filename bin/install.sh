#!/bin/bash

# Dotfiles installation

# Check if the file is running in the correct directory
CWD=$(pwd)

if [[ $CWD == */bin ]]; then
    echo "ERROR: Please run the script in the root directory of the project!" 1>&2
    exit 1
fi

# TODO: add parameters to only install a specific folder

## Git config -------

# Copy the local file
echo "Creating local git config file..."

FILE=git/.gitconfig.local
if [[ -f "$FILE" ]]; then
    echo "Local git file already exists."
else 
    cp git/.gitconfig.local.template git/.gitconfig.local
    echo "Local git config file created successfully!"
fi

# Create the local symlink
echo "Creating git config symlinks..."

FILE_LINK=~/.gitconfig
SKIP_GIT_CONFIG=0
if [ -L "$FILE_LINK"  ] || [ -f "$FILE_LINK" ]; then # Check if the file or the symlink already exists
    echo "$FILE_LINK already exists!"
    read -p "Replace file existing file with the new symlink? y/n " -n 1 -r DELETE_CONFIRMATION
    echo # Add line skip
    if [[ $DELETE_CONFIRMATION =~ ^[Yy]$ ]]; then
        rm $FILE_LINK
    else
        echo "Skipping..."
        SKIP_GIT_CONFIG=1
    fi
fi

if [[ $SKIP_GIT_CONFIG = 0 ]]; then
    ln -s "$CWD/git/.gitconfig.main" ~/.gitconfig
    ln -s "$CWD/git/.gitconfig.local" ~/.gitconfig.local
    ln -s "$CWD/git/.gitconfig.aliases" ~/.gitconfig.aliases
    echo "Git config symlink created successfully!"
else
    echo "Git config symlink skipped!"
fi

## End Git config -------

## Bash config -------

# Copy the local file
echo "Creating local bash config file..."

FILE=bash/.bash_local
if [[ -f "$FILE" ]]; then
    echo "Local bash file already exists."
else 
    cp bash/.bash_local.template bash/.bash_local
    echo "Local bash config file created successfully!"
fi

# Create the local symlink
echo "Creating bash config symlinks..."

FILE_LINK=~/.bashrc
SKIP_BASH_CONFIG=0
if [ -L "$FILE_LINK"  ] || [ -f "$FILE_LINK" ]; then # Check if the file or the symlink already exists
    echo "$FILE_LINK already exists!"
    read -p "Replace file existing file with the new symlink? y/n " -n 1 -r DELETE_CONFIRMATION
    echo # Add line skip
    if [[ $DELETE_CONFIRMATION =~ ^[Yy]$ ]]; then
        rm $FILE_LINK
    else
        echo "Skipping..."
        SKIP_BASH_CONFIG=1
    fi
fi

if [[ $SKIP_BASH_CONFIG = 0 ]]; then
    ln -s "$CWD/bash/.bashrc" ~/.bashrc
    ln -s "$CWD/bash/.bash_local" ~/.bash_local
    ln -s "$CWD/bash/.bash_aliases" ~/.bash_aliases
    echo "Bash config symlink created successfully!"
else
    echo "Bash config symlink skipped!"
fi

## End bash config -------

echo "Installation completed!"

exit 0