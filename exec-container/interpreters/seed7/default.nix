{pkgs}: let
  seed7-source = pkgs.seed7-source;
  seed7 = pkgs.stdenv.mkDerivation {
    name = "seed7";
    src = seed7-source;
    installPhase = ''
      mkdir -p $out
      cp -r $src/* $out
      chmod -R 777 $out
      cd $out/src
      make depend
      make
      chmod -R 755 $out
    '';
  };
in
  pkgs.writeShellScriptBin "s7" "exec ${seed7}/prg/s7 $@"
