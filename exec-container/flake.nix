{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils,... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        bin_flatten_drv = import ./utils/bin_flatten.nix { inherit pkgs; };
        bin_link_drv = import ./utils/bin_link.nix { inherit pkgs; };
        python_drv = import ./python/python-all.nix {
          inherit pkgs;
          inherit bin_flatten_drv;
          inherit bin_link_drv;
        };
      in
      {
        packages = {
          default = bin_flatten_drv {
            drvs = [ python_drv ];
          };
        };
      }
    );
}
