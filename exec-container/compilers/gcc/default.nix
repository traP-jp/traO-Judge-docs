{pkgs}: let
  myGcc = pkgs.gcc;
in
  pkgs.writeShellScriptBin "gcc" "exec ${myGcc}/bin/gcc $@"
