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

echo "Browse to http://127.0.0.1:8081/ to see the served website"

${CONTAINER} run --rm -it \
  --volume="$PWD:/srv/jekyll:z" \
  -p 8081:4000 \
  ${JEKYLL_IMAGE} \
  jekyll serve
