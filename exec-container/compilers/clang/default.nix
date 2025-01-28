{pkgs}: let
  myClang = pkgs.clang;
#  myBoost = pkgs.boost;
#  myGmp = pkgs.gmp;
#  myEigen = pkgs.eigen;
#  myAcLibrary = pkgs.ac-library;
in
  pkgs.writeShellScriptBin "clang++" ''
    mkdir -p /tmp
    chmod 1777 /tmp
    exec "${myClang}/bin/clang++" "$@"
  ''
