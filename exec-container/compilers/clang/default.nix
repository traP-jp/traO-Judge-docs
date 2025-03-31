{pkgs}: let
  myClang = pkgs.clang;
  myBoost = pkgs.boost;
  myGmp = pkgs.gmp;
  myEigen = pkgs.eigen;
  myAcLibrary = pkgs.ac-library;
  myZ3 = pkgs.z3;
in
  pkgs.writeShellScriptBin "clang++" ''
    export LD_LIBRARY_PATH="${myBoost}/lib:${myGmp}/lib:${myEigen}/share:${myZ3.lib}/lib:$LD_LIBRARY_PATH"
    export LIBRARY_PATH="${myBoost}/lib:${myGmp}/lib:${myEigen}/share:${myZ3.lib}/lib:$LIBRARY_PATH"
    export CPLUS_INCLUDE_PATH="${myBoost.dev}/include:${myGmp.dev}/include:${myEigen}/include:${myAcLibrary.dev}/include:${myZ3.dev}/include:$CPLUS_INCLUDE_PATH"
    exec "${myClang}/bin/clang++" "$@" -lgmpxx -lgmp -lz3
  ''
  // {
    traojudge = {
      languages = [
        {
          binName = "clang++";
          compile = cfg: "${pkgs.coreutils}/bin/cp ${cfg.src} ${cfg.temp}/main.cpp && \
            ${myClang}/bin/clang++ -std=c++23 -o ${cfg.out} ${cfg.temp}/main.cpp -lgmpxx -lgmp -lz3";
          name = "C++(clang)";
          run = cfg: "exec ${cfg.out}";
        }
      ];
    };
  }
