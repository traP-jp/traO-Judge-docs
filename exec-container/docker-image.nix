{pkgs}: let
  interpreters = import ./interpreters {inherit pkgs;};
  compilers = import ./compilers {inherit pkgs;};
  tools = import ./tools {inherit pkgs;};
in
  pkgs.dockerTools.buildImage {
    name = "exec-container";

    copyToRoot = interpreters.all ++ compilers.all ++ tools.all;
  }
