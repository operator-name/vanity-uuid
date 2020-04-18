with import <nixpkgs> {};

let
    hexwords = pkgs.writeShellScriptBin "hexwords" ''
        ${coreutils}/bin/cat english-words/words.txt | ${coreutils}/bin/tr '[:upper:]' '[:lower:]' | ${coreutils}/bin/tr --delete --complement '[:alnum:]\n' | ${gnugrep}/bin/grep -E "^(for|o|i|l|s|t|g|a|b|c|d|e|f|0|1|2|3|4|5|6|7|8|9|-|')*$" | ${coreutils}/bin/sort | ${coreutils}/bin/uniq
    '';
    # ''$ escapes $ to avoid ${}
    vanity-uuid4 = pkgs.writeShellScriptBin "vanity-uuid4" ''
        uuid0=$(${gnugrep}/bin/grep -E "^.{8}$" "''${BASH_SOURCE%/*}/hexwords.txt" | ${coreutils}/bin/shuf -n 1)
        uuid1=$(${gnugrep}/bin/grep -E "^.{4}$" "''${BASH_SOURCE%/*}/hexwords.txt" | ${coreutils}/bin/shuf -n 1)
        uuid2=4$(${gnugrep}/bin/grep -E "^.{3}$" "''${BASH_SOURCE%/*}/hexwords.txt" | ${coreutils}/bin/shuf -n 1)
        uuid3=$(${gnugrep}/bin/grep -E "^(a|b).{3}$" "''${BASH_SOURCE%/*}/hexwords.txt" | ${coreutils}/bin/shuf -n 1)
        uuid4=$(${gnugrep}/bin/grep -E "^.{12}$" "''${BASH_SOURCE%/*}/hexwords.txt" | ${coreutils}/bin/shuf -n 1)
        uuid=$uuid0-$uuid1-$uuid2-$uuid3-$uuid4

        echo $uuid 
        echo $uuid | ${gnused}/bin/sed "s/o/0/g;s/i/1/g;s/l/1/g;s/s/5/g;s/t/7/g"
    '';
    vanity-uuid-nospec = pkgs.writeShellScriptBin "vanity-uuid-nospec" ''
        uuid0=$(${gnugrep}/bin/grep -E "^.{8}$" "''${BASH_SOURCE%/*}/hexwords.txt" | ${coreutils}/bin/shuf -n 1)
        uuid1=$(${gnugrep}/bin/grep -E "^.{4}$" "''${BASH_SOURCE%/*}/hexwords.txt" | ${coreutils}/bin/shuf -n 1)
        uuid2=$(${gnugrep}/bin/grep -E "^.{4}$" "''${BASH_SOURCE%/*}/hexwords.txt" | ${coreutils}/bin/shuf -n 1)
        uuid3=$(${gnugrep}/bin/grep -E "^.{4}$" "''${BASH_SOURCE%/*}/hexwords.txt" | ${coreutils}/bin/shuf -n 1)
        uuid4=$(${gnugrep}/bin/grep -E "^.{12}$" "''${BASH_SOURCE%/*}/hexwords.txt" | ${coreutils}/bin/shuf -n 1)
        uuid=$uuid0-$uuid1-$uuid2-$uuid3-$uuid4

        echo $uuid 
        echo $uuid | ${gnused}/bin/sed "s/o/0/g;s/i/1/g;s/l/1/g;s/s/5/g;s/t/7/g"
    '';
in stdenv.mkDerivation rec {
    name = "vanity-uuid";
    src = ./.;

    buildInputs = [ 
        gnugrep
        gnused
        coreutils

        hexwords 
        vanity-uuid4
        vanity-uuid-nospec
    ];

    installPhase = ''
        mkdir -p $out/bin/

        cp hexwords.txt $out/bin/
        cp ${vanity-uuid4}/bin/vanity-uuid4 $out/bin/
        cp ${vanity-uuid-nospec}/bin/vanity-uuid-nospec $out/bin/
    '';
}
