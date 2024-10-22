{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
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
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    gods,
    gonum,
    gostl,
    golang-org-exp,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          (final: prev: {
            myGoLibraries = {
              inherit gods gonum gostl golang-org-exp;
            };
          })
        ];
      };
    in {
      packages.default = import ./docker-image.nix {inherit pkgs;};
      formatter = pkgs.alejandra;
    });
}
