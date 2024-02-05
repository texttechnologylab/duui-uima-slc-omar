#!/usr/bin/env bash
set -euo pipefail

export TEXTIMAGER_DUUI_TRANSFORMERS_TOXIC_ANNOTATOR_CUDA=
#export TEXTIMAGER_DUUI_TRANSFORMERS_TOXIC_ANNOTATOR_CUDA="-cuda"

export TEXTIMAGER_DUUI_TRANSFORMERS_TOXIC_ANNOTATOR_NAME=textimager-duui-transformers-toxic
export TEXTIMAGER_DUUI_TRANSFORMERS_TOXIC_ANNOTATOR_VERSION=0.1.0
export TEXTIMAGER_DUUI_TRANSFORMERS_TOXIC_LOG_LEVEL=DEBUG
export TEXTIMAGER_DUUI_TRANSFORMERS_TOXIC_MODEL_CACHE_SIZE=3
export DOCKER_REGISTRY="docker.texttechnologylab.org/"


docker build \
  --build-arg TEXTIMAGER_DUUI_TRANSFORMERS_TOXIC_ANNOTATOR_NAME \
  --build-arg TEXTIMAGER_DUUI_TRANSFORMERS_TOXIC_ANNOTATOR_VERSION \
  --build-arg TEXTIMAGER_DUUI_TRANSFORMERS_TOXIC_LOG_LEVEL \
  -t ${DOCKER_REGISTRY}${TEXTIMAGER_DUUI_TRANSFORMERS_TOXIC_ANNOTATOR_NAME}:${TEXTIMAGER_DUUI_TRANSFORMERS_TOXIC_ANNOTATOR_VERSION}${TEXTIMAGER_DUUI_TRANSFORMERS_TOXIC_ANNOTATOR_CUDA} \
  -f src/main/docker/Dockerfile${TEXTIMAGER_DUUI_TRANSFORMERS_TOXIC_ANNOTATOR_CUDA} \
  .

docker tag \
  ${DOCKER_REGISTRY}${TEXTIMAGER_DUUI_TRANSFORMERS_TOXIC_ANNOTATOR_NAME}:${TEXTIMAGER_DUUI_TRANSFORMERS_TOXIC_ANNOTATOR_VERSION}${TEXTIMAGER_DUUI_TRANSFORMERS_TOXIC_ANNOTATOR_CUDA} \
  ${DOCKER_REGISTRY}${TEXTIMAGER_DUUI_TRANSFORMERS_TOXIC_ANNOTATOR_NAME}:latest${TEXTIMAGER_DUUI_TRANSFORMERS_TOXIC_ANNOTATOR_CUDA}
