#!/bin/bash

#destination_folder='converted'
destination_folder='../nxengine-evo/build/CaveStory/data/lang/italian'

# create directory if not present
mkdir -p "$destination_folder/Stage"

# iterate over every .txt file in this folder
for txtfile in ./*.txt; do
    tscfile="$(basename $txtfile .txt).tsc"

    echo "Converting $txtfile into $tscfile"
    ./tsconvert "$txtfile" "$destination_folder/$tscfile"
done

# do the same for every .txt file in the Stage folder
for txtfile in Stage/*.txt; do
    tscfile="Stage/$(basename $txtfile .txt).tsc"

    echo "Converting $txtfile into $tscfile"
    ./tsconvert "$txtfile" "$destination_folder/$tscfile"
done

# copy all .pbm files
echo "Copying image files and metadata"
cp *.pbm "$destination_folder/"
cp metadata "$destination_folder/"

#copy other files
echo "Copying .md files"
cp system.json "$destination_folder/"
cp *.md "$destination_folder/"
