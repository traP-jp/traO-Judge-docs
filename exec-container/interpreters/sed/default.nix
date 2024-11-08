{pkgs}: let
  mySed = pkgs.gnused;
in
  pkgs.writeShellScriptBin "sed" "exec ${mySed}/bin/sed $@"
