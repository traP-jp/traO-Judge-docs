{pkgs}: let
  mySage = pkgs.sage;
in
  pkgs.writeShellScriptBin "sage" "exec ${mySage}/bin/sage $@"
