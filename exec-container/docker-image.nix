{pkgs}: let
  interpreters = import ./interpreters {inherit pkgs;};
in
  pkgs.dockerTools.buildImage {
    name = "exec-container";

    copyToRoot = interpreters.all;
  }
