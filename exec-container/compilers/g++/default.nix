{pkgs}: let
  myGcc = pkgs.gcc;
  myBoost = pkgs.boost;
  myGmp = pkgs.gmp;
  myEigen = pkgs.eigen;
  myAcLibrary = pkgs.ac-library;
in
  pkgs.writeShellScriptBin "g++" ''
    export LD_LIBRARY_PATH="${myBoost}/lib:${myGmp}/lib:${myEigen}/share:$LD_LIBRARY_PATH"
    export LIBRARY_PATH="${myBoost}/lib:${myGmp}/lib:${myEigen}/share:$LIBRARY_PATH"
    export CPLUS_INCLUDE_PATH="${myBoost.dev}/include:${myGmp.dev}/include:${myEigen}/include:${myAcLibrary.dev}/include:$CPLUS_INCLUDE_PATH"
    exec "${myGcc}/bin/g++" "$@" -lgmpxx -lgmp
  ''
  // {
    traojudge = {
      languages = [
        {
          binName = "g++";
          compile = "${myClang}/bin/g++ -std=c++23 -o $OUT $SRC";
          name = "C++(g++)";
          run = "$OUT";
        }
      ];
    };
  }
