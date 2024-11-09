{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    container-env.url = "../";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    container-env,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
      in {
        packages.default = pkgs.dockerTools.buildImage {
          name = "exec-container";
          copyToRoot = [
            container-env.packages.${system}.default
          ];
        };
      }
    );
}
