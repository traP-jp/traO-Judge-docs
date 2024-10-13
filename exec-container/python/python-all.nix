{
  pkgs, bin_flatten_drv, bin_link_drv, ...
}: let
  python311drv = import ./python-3-11.nix { inherit pkgs; inherit bin_link_drv; };
  python312drv = import ./python-3-12.nix { inherit pkgs; inherit bin_link_drv; };
in
  bin_flatten_drv {
    pkgs = pkgs;
    drvs = [ python311drv python312drv ];
  }
