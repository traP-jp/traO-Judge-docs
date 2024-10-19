{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nix-filter.url = "github:numtide/nix-filter";
  };

  outputs = { nixpkgs, flake-utils, nix-filter,... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        filter = nix-filter.lib;
        python-all = import ./python/python-all.nix {
          inherit pkgs;
          inherit filter;
        };
      in
      {
        packages = {
          default = pkgs.symlinkJoin {
            name = "default-all";
            paths = [
              python-all
            ];
          };
        };
      }
    );
}
