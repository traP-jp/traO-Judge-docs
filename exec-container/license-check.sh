#!/usr/bin/env bash

if type sbomnix &> /dev/null; then
    sbomnix .#environment
else
    nix-shell -p sbomnix --run "sbomnix .#environment"
fi

if grep -q "AGPL" sbom.spdx.json; then
    echo "Error: AGPL license found in sbom.spdx.json."
    exit 1
fi
