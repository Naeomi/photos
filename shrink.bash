#!/bin/bash

export FILE=$1

if [ ! -f ./.git/config ]; then
    echo "Not in respository root";
    exit 1;
fi

if [ ! -f ${FILE} ]; then
    echo "Cannot find file: ${FILE}";
    exit 1;
fi

set -vx
convert ${FILE} -resize 25% -quality 50 ${FILE}.small.jpg
