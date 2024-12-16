{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-2405.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-2411.url = "github:NixOS/nixpkgs/nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";
    toj-helper.url = "github:traP-jp/traO-Judge-helper";
    pyproject-nix = {
      url = "github:nix-community/pyproject.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    uv2nix = {
      url = "github:adisbladis/uv2nix";
      inputs.pyproject-nix.follows = "pyproject-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    gods = {
      url = "github:emirpasic/gods/v1.18.1";
      flake = false;
    };
    gonum = {
      url = "github:gonum/gonum/v0.15.1";
      flake = false;
    };
    gostl = {
      url = "github:liyue201/gostl/v1.2.0";
      flake = false;
    };
    golang-org-exp = {
      # No version tag available in the repository. (v0.0.0-20241009180824-f66d83c29e7c)
      url = "github:golang/exp/225e2abe05e664228e7afb6bf5b97a25d56ba575";
      flake = false;
    };
    seed7-source = {
      url = "github:ThomasMertes/seed7";
      flake = false;
    };
  };

  outputs = flake-inputs @ {
    self,
    nixpkgs,
    nixpkgs-2405,
    nixpkgs-2411,
    flake-utils,
    toj-helper,
    uv2nix,
    pyproject-nix,
    rust-overlay,
    gods,
    gonum,
    gostl,
    golang-org-exp,
    seed7-source,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      allpkgs = import ./allpkgs.nix {inherit flake-inputs system;};
      pkgs = allpkgs.default;
    in {
      packages = {
        environment = let
          interpreters = import ./interpreters {inherit allpkgs;};
          compilers = import ./compilers {inherit allpkgs;};
          tools = import ./tools {inherit allpkgs;};
          misc = import ./misc {inherit allpkgs;};
        in
          pkgs.symlinkJoin {
            name = "exec-container-enviroment";
            paths = [
              interpreters.all
              compilers.all
              tools.all
              misc.all
            ];
          };
        default = pkgs.dockerTools.buildImage {
          name = "exec-container";
          copyToRoot = [
            self.packages.${system}.environment
          ];
        };
        languageSettings = let
          interpreters = import ./interpreters {inherit allpkgs;};
          jsonOutput = builtins.toJSON(interpreters.traojudge);
        in
          pkgs.writeText "traojudge.json" jsonOutput;
      };
      
      formatter = pkgs.alejandra;
    });
}
