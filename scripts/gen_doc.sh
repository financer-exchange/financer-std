#!/usr/bin/env bash

if ! [[ $(move --version) =~ "financer" ]]; then
   echo "Install the financer version of the move cli"
   exit 1
fi

# Need to temporarily replace the module addresses defined in Move.toml.
sed -i '' 's/.*financer_std=.*/financer_std="0x1"/g' Move.toml

move docgen --exclude-impl --exclude-specs --exclude-private-fun --module-name financer_std --section-level-start 0 --output-directory docs

# Restore Move.toml
git checkout Move.toml
