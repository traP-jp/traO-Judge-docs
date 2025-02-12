{pkgs}: let
  myClang = pkgs.clang;
  myBoost = pkgs.boost;
  myGmp = pkgs.gmp;
  myEigen = pkgs.eigen;
  myAcLibrary = pkgs.ac-library;
in
  pkgs.writeShellScriptBin "clang++" ''
    export LD_LIBRARY_PATH="${myBoost}/lib:${myGmp}/lib:${myEigen}/share:$LD_LIBRARY_PATH"
    export LIBRARY_PATH="${myBoost}/lib:${myGmp}/lib:${myEigen}/share:$LIBRARY_PATH"
    export CPLUS_INCLUDE_PATH="${myBoost.dev}/include:${myGmp.dev}/include:${myEigen}/include:${myAcLibrary.dev}/include:$CPLUS_INCLUDE_PATH"
    exec "${myClang}/bin/clang++" "$@" -lgmpxx -lgmp
  ''
  // {
    traojudge = {
      languages = [
        {
          binName = "clang++";
          compile = "${myClang}/bin/g++ -std=c++23 -o $OUT $SRC";
          name = "C++(clang)";
          run = "$OUT";
        }
      ];
    };
  }
