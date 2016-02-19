#!/bin/bash
DESTINATION_FOLDER="$HOME/bin/"

install(){
    if [ -d $DESTINATION_FOLDER ]; then
        echo "$DESTINATION_FOLDER already exists."
    else
        mkdir $DESTINATION_FOLDER
    fi

    # TODO: make installation process more user-friendly. Eg: compare file versions.
    echo "Installing..."
    if [ -d ./scripts/ ]; then
        for file in ./scripts/*; do
            filename=$(basename $file)
            echo "Installing $filename..."
            cp -i $file $DESTINATION_FOLDER
            chmod +700 $DESTINATION_FOLDER$filename
        done
    else
        echo "Couldn't find scripts folder."
        exit 1
    fi
    echo "Finished installation process."
    #TODO: Automatically add $DESTINATION_FOLDER to the PATH.
    echo "Please add $DESTINATION_FOLDER to your PATH variable in order to run the commands"
    exit
}

echo "This program will install all the scripts in $DESTINATION_FOLDER"
read -p "Do you wish to continue? [y/n]" yn

case $yn in
    [Yy]* ) install;;
    [Nn]* ) echo "Aborting install process"; exit;;
    * ) echo "Please answer yes or no."; exit;;
esac
