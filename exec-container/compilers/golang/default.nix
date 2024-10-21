{pkgs}: let
  goCompiler = import ./compiler.nix {inherit pkgs;};
  goMod = import ./go-mod.nix {inherit pkgs;};
in
  pkgs.symlinkJoin {
    name = "golang";
    paths = [goCompiler goMod];
  }
