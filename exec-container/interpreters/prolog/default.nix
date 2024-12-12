{pkgs, ...}: let
  myProlog = pkgs.swi-prolog;
in
  pkgs.writeShellScriptBin "swipl" "exec ${myProlog}/bin/swipl $@"
