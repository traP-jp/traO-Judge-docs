{pkgs}: let
  myAwk = pkgs.gawk;
in
  pkgs.writeShellScriptBin "awk" "exec ${myAwk}/bin/gawk $@"
