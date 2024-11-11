{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    myCompilers.url = "./compilers";
    myInterpreters.url = "./interpreters";
    myTools.url = "./tools";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    myCompilers,
    myInterpreters,
    myTools,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
    in {
      packages = {
        environment = pkgs.symlinkJoin {
          name = "exec-container-enviroment";
          paths = [
            (myCompilers.all {inherit pkgs;})
            (myInterpreters.all {inherit pkgs;})
            (myTools.all {inherit pkgs;})
          ];
        };
        default = pkgs.dockerTools.buildImage {
          name = "exec-container";
          copyToRoot = [
            self.packages.${system}.environment
          ];
        };
      };
      formatter = pkgs.alejandra;
    });
}
