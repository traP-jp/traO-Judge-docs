{pkgs}: let
  myBash = pkgs.bash;
in
  pkgs.writeShellScriptBin "bash" "exec ${myBash}/bin/bash $@"