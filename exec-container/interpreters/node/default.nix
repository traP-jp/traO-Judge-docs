{pkgs}: let
  myNode = pkgs.nodejs_22;
  executable-node = pkgs.writeShellScriptBin "node" "exec ${myNode}/bin/node $@";
  executable-npm = pkgs.writeShellScriptBin "npm" "exec ${myNode}/bin/npm $@";
in
  pkgs.symlinkJoin {
    name = "node and npm";
    paths = [
      executable-node
      executable-npm
    ];
  }
