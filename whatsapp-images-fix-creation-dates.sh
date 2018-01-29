#!/bin/bash

# Changes created and modified date on files with Whatsapp's filename format: IMG-YYYYMMDD-
#
# Expected filename format example: IMG-20170715-WA0004
#
# This script uses Apple SetFile
# https://developer.apple.com/legacy/library/documentation/Darwin/Reference/ManPages/man1/SetFile.1.html

inputDirectory=$1
outputDirectory=$2

if [[ -z $inputDirectory || ! -d $inputDirectory ]]; then
    echo "Error: didn't receive an input directory"
    exit 1
fi

if [[ -z $outputDirectory ]]; then
    echo "No output directory specified, using 'result'"
    outputDirectory="./result"
fi

if [[ ! -d $outputDirectory ]]; then
    echo "Creating output directory"
    mkdir $outputDirectory
fi

cp -p $inputDirectory/* $outputDirectory

for file in $outputDirectory/*
do
    if [[ -f $file ]]; then
        if [[ $file =~ IMG-[0-9]{8} ]]; then

            date=$( echo $file | sed 's/.*IMG-\([0-9]\{8\}\)-.*/\1/' )
            year=${date:0:4}
            month=${date:4:2}
            day=${date:6:2}
            hour="11"

            dateString="$month/$day/$year $hour:00:00"

            SetFile -d "$dateString" -m "$dateString" $file

            echo "Applied to $file"
        else
            echo "Not good file: $file"
        fi
    fi
done

echo "Done"
