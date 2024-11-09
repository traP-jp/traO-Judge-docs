{pkgs, ...}: let
  myBrainfuck = pkgs.bfc;
  myClang = pkgs.clang;
in
  pkgs.writeShellScriptBin "bfc" "PATH=${myClang}/bin:$PATH exec ${myBrainfuck}/bin/bfc $@"
