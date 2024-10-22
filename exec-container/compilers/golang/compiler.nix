{pkgs}: let
  goCompiler = pkgs.go;
in
  pkgs.writeShellScriptBin "go" "exec ${goCompiler}/share/go/bin/go $@"
