#!/bin/bash
# https://jnet.forumotion.com/t2069-slow-network-git-getter-bash-script-for-linux#3201
# Created By J~Net (c) 2024
#
# ./slow-network-git-getter.sh
#
TO_GET="https://github.com/rhasspy/piper-recording-studio.git"
#
#
echo "Slow Network Git Getter Created By J~Net (c) 2024"
echo ""

# Extract the repository name from the URL
REPO_NAME=$(basename -s .git $TO_GET)

# Clone the repository with shallow depth
git clone --depth=1 $TO_GET

# Check if the clone was successful
if [ $? -eq 0 ]; then
    echo "Repository cloned successfully."
    # Navigate to the cloned repository directory
    cd $REPO_NAME || { echo "Failed to navigate to $REPO_NAME"; exit 1; }

    # Fetch the remaining history
    git fetch --unshallow

    echo "All Done!"
else
    echo "Failed to clone repository."
fi

echo ""

