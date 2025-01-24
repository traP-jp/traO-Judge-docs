{pkgs}: let
  ac-library = pkgs.ac-library;
in
  pkgs.stdenv.mkDerivation {
    name = "ac library";
    src = ac-library;
    installPhase = ''
      mkdir -p $out
      cp -r $src/include $out/include
    '';
  }
