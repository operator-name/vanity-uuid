#!/usr/bin/env bash

nix-build
cp -rf result/bin/* bin/bash/

sed -i 's,/nix.*bash,/usr/bin/env bash,g;s,/nix.*grep,grep,g;s,/nix.*shuf,shuf,g;s,/nix.*sed,sed,g' bin/bash/vanity-uuid*

