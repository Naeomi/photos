#!/bin/bash

if [ ! -f ./.git/config ]; then
    echo "Not in respository root";
    exit 1;
fi

export CONTAINER=${CONTAINER:-docker}

export JEKYLL_IMAGE="docker.io/jekyll/jekyll:4.2.0"

${CONTAINER} pull ${JEKYLL_IMAGE}
mkdir .jekyll-cache
mkdir _site

${CONTAINER} run --rm -it \
  --volume="$PWD:/srv/jekyll:z" \
  ${JEKYLL_IMAGE} \
  jekyll build
