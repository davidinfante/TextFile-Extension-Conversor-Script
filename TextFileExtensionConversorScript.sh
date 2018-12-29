#!/bin/bash

# by davidinfante - 29/12/2018

# unoconv must be installed
# https://github.com/dagwieers/unoconv
# sudo apt install unoconv


# Input extension (with * before the extension)
INPUT_EXT=*lwp
# Output extension
OUTPUT_EXT=doc
# Directory of the files to convert
DIRECTORY=./archivoslwp


# Script
cd $DIRECTORY

# Loop for years' folders
for years in */; do
    cd $years

    # Loop for expedientes' folders
    for expedientes in */; do
        cd $expedientes/Escritos

        # Loop to convert files
        for filename in $INPUT_EXT; do
            unoconv -f "$OUTPUT_EXT" "$filename"
            echo "$filename - converted"
        done

        cd ..
        cd ..
    done

    cd ..
done

echo "Conversion from $INPUT_EXT to $OUTPUT_EXT finished"
