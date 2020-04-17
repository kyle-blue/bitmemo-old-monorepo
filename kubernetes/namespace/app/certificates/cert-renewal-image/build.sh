#!/bin/bash

REGISTRY="registry.gitlab.com/bigboiblue/bitmemo"
NAME="cert-renewal"
DIR=$(dirname "$0")
cd "$DIR"
docker build . -t "$REGISTRY/$NAME:0.1" -t "$REGISTRY/$NAME:latest"
docker push "$REGISTRY/$NAME" # Pushes for every tag