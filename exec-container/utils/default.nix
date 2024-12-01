{pkgs, ...}: {
  simple-bin = {package, bin-name}:
  pkgs.writeShellScriptBin bin-name "exec ${package}/bin/${bin-name} $@";
}
