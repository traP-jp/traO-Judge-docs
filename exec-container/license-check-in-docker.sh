#!/bin/bash

docker build -t trao-nix .
docker volume create trao-nix_build-cache
docker run -v ./result:/result -v trao-nix_build-cache:/nix -v ./flake.lock:/workspace/flake.lock trao-nix /workspace/license-check.sh
