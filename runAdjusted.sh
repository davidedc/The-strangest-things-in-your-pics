#!/bin/bash
if [ "$#" -eq 0 ];
then
    echo running on default
    echo -----------------------------------------------------------------------------
    IMAGE=''
    python ~/classify_image.py --num_top_predictions 1 $IMAGE 2> /dev/null
fi
for var in "$@"
do
    IMAGE='--image_file ./'$var
    echo running on $var
    echo -----------------------------------------------------------------------------
    python ~/classify_image.py --num_top_predictions 1 $IMAGE 2> /dev/null
    echo
done
