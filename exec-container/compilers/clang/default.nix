{pkgs}: let
  myClang = pkgs.clang;
  myBoost = pkgs.boost;
  myGmp = pkgs.gmp;
  myEigen = pkgs.eigen;
  myAcLibrary = pkgs.ac-library;
  myZ3 = pkgs.z3;
in
  pkgs.writeShellScriptBin "clang++" ''
    # pkgs.dockerToolsのデフォルトでtmpディレクトリがないので作成
    # TODO: 毎回`mkdir`を走らせるのもあれなのでflake.nixのrunAsRootでやりたい（Docker内ビルドでは失敗する？）
    # https://github.com/NixOS/nixpkgs/issues/257172
    mkdir -p /tmp
    chmod 1777 /tmp

    export LD_LIBRARY_PATH="${myBoost}/lib:${myGmp}/lib:${myEigen}/share:$LD_LIBRARY_PATH"
    export LIBRARY_PATH="${myBoost}/lib:${myGmp}/lib:${myEigen}/share:$LIBRARY_PATH"
    export CPLUS_INCLUDE_PATH="${myBoost.dev}/include:${myGmp.dev}/include:${myEigen}/include:${myAcLibrary.dev}/include:${myZ3.dev}/include:$CPLUS_INCLUDE_PATH"
    exec "${myClang}/bin/clang++" "$@" -lgmpxx -lgmp
  ''
