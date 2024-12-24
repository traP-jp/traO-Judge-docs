#!/bin/bash

set -eux

touch result
docker build -t trao-nix .
docker volume create trao-nix_cache
docker run -v ./result:/result -v trao-nix_cache:/nix/store trao-nix /workspace/docker/languageSettings-in-docker.sh
