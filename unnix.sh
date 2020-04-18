#!/usr/bin/env bash


sed 's,/nix.*bash,/usr/bin/env bash,g;s,/nix.*grep,grep,g;s,/nix.*shuf,shuf,g;s,/nix.*sed,sed,g'

