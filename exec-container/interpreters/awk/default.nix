{pkgs}: let
  myAwk = pkgs.gawk;
in
  pkgs.writeShellScriptBin "bash" "exec ${myAwk}/bin/bash $@"
