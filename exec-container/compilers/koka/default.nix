{pkgs}: let
  mySed = pkgs.koka;
in
  pkgs.writeShellScriptBin "koka" "exec ${mySed}/bin/koka $@"
