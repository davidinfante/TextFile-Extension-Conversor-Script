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
# True if /Escritos exists
escr_exists=false


# Script
cd $DIRECTORY

# Loop for years' folders
for years in */; do
    cd $years

    # Loop for expedientes' folders
    for expedientes in */; do
        cd $expedientes
        # Escritos folder check
	    if [ -d Escritos ]; then
		    cd Escritos
           	escr_exists=true
	    fi

        # Loop to convert files
        for filename in $INPUT_EXT; do
            unoconv -f "$OUTPUT_EXT" "$filename"
            echo "$filename - converted"
        done

        if [ "$escr_exists" = true ]; then
            cd ..
            escr_exists=false
        fi

        cd ..
    done

    cd ..
done

echo "Conversion from $INPUT_EXT to $OUTPUT_EXT finished"
