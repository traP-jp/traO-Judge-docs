{pkgs, ...}: 
let
  cargo = pkgs.cargo;
  vendor = pkgs.rustPlatform.fetchCargoTarball {
    src = ./.;
    hash = "sha256-QVNROkDMBhk7WHeDFYO+x7k/nI3UtESeGueSjRCOZZU=";
  };
in 
  pkgs.stdenv.mkDerivation {
    name = "rust";
    src = vendor;
    buildInputs = [
      cargo
    ];
    installPhase = ''
      mkdir -p $out/misc/rust
      mkdir -p $out/bin
      ln -s ${cargo}/bin/cargo $out/bin/cargo
      ln -s $src $out/misc/rust/vendor.tar.gz
    '';
  }
