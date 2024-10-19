{
  pkgs, filter, ...
}: let
  compiler = import ./compiler.nix { inherit pkgs; inherit filter; };
  vendor = import ./library.nix { inherit pkgs; };
in
  pkgs.symlinkJoin {
    name = "python-all";
    paths = [
      compiler
      vendor
    ];
  }
