{allpkgs}: let
  pkgs = allpkgs.default;
in {
  all = [
    pkgs.coreutils
    pkgs.toj-helper
  ];
}
