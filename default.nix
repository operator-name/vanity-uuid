with import <nixpkgs> {};

let
    # stdenv comes with sed tr grep
    hexwords = pkgs.writeShellScriptBin "hexwords" ''
        grep -E "(for|o|i|l|s|t|g|a|b|c|d|e|f|0|1|2|3|4|5|6|7|8|9|-|')*" english-words/words_alpha.txt
    '';
in stdenv.mkDerivation rec {
    name = "vanity-uuid";

    buildInputs = [ hexwords ];
}