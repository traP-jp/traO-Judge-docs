{pkgs}: let
  mySh = pkgs.bash;
in
  pkgs.writeShellScriptBin "sh" "exec ${mySh}/bin/bash $@"
