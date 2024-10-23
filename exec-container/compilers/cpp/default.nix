{pkgs}: let
  gcc = pkgs.callPackage ./gcc.nix {};
in [gcc]
