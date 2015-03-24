#!/bin/bash

scriptPath="$( readlink -f "$( dirname "$0" )" )/$( basename "$0" )"
currentDirectory=$(dirname $scriptPath)
settingDirectory=$currentDirectory/.jaikoz
fileDirectory=$currentDirectory/files

# Create the shared directories
if [ ! -e "$settingDirectory" ]
then
    mkdir $settingDirectory
fi
if [ ! -e "$fileDirectory" ]
then
    mkdir $fileDirectory
fi

# Authorize X server to accept connections
xhost +

# Run the application
docker run -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -v $settingDirectory:/root/.jaikoz \
    -v $fileDirectory:/root/files \
    --rm \
    --name jaikoz \
    neolao/jaikoz

