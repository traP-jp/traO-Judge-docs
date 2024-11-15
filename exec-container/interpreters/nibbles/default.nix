{pkgs}: let
  nibbles-source = pkgs.nibbles-source;
  ghc = pkgs.haskell.compiler.ghc8107;
  nibbles = pkgs.stdenv.mkDerivation {
    name = "nibbles";
    buildInputs = [ghc];
    src = nibbles-source;
    installPhase = ''
      mkdir -p $out
      cp -rT $src $out
      cd $out
      chmod -R 777 $out
      ghc -O -package ghc *.hs
      touch ./hello.nbl
      echo "\"Hello, World\"" > ./hello.nbl
      ./nibbles ./hello.nbl
      chmod -R 755 $out
      echo $out
    '';
  };
in
  pkgs.writeShellScriptBin "nibbles" ''
    export PATH=${ghc}/bin:$PATH
    filepath=$(realpath "$1")
    echo $filepath
    echo ${nibbles}
    cd ${nibbles}
    exec ./nibbles $filepath
  ''
