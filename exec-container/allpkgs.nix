{
  flake-inputs,
  system,
}: let
  overlays = with flake-inputs; [
    (final: prev: {
      myGoLibraries = {
        inherit gods gonum gostl golang-org-exp;
      };
    })
    (final: prev: {
      inherit uv2nix pyproject-nix;
    })
    rust-overlay.overlays.default
    (final: prev: {
      inherit seed7-source;
    })
    (final: prev: {
      toj-utils = import ./utils {pkgs = prev;};
    })
  ];
  to-pkgs = {
    nixpkgs,
    system,
  }:
    import nixpkgs {
      inherit system overlays;
    };
in
  with flake-inputs; {
    default = to-pkgs {inherit system nixpkgs;};
    release2405 = to-pkgs {
      inherit system;
      nixpkgs = nixpkgs-2405;
    };
    release2411 = to-pkgs {
      inherit system;
      nixpkgs = nixpkgs-2411;
    };
  }
