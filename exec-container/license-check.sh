#!/usr/bin/env bash

if ! command -v sbomnix &> /dev/null
then
    echo "sbomnix not found. Run \`nix profile install nixpkgs#sbomnix\` to install."
    exit 1
fi

sbomnix .#environment

if grep -q "AGPL" sbom.spdx.json; then
    echo "Error: AGPL license found in sbom.spdx.json."
    exit 1
fi
