{
  pkgs, filter, ...
}: let
  python311 = import ./python-3-11.nix { inherit pkgs; inherit filter; };
  python312 = import ./python-3-12.nix { inherit pkgs; inherit filter; };
in
  pkgs.symlinkJoin {
    name = "python-all";
    paths = [
      python311
      python312
    ];
  }
