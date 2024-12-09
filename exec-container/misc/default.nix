# Files which is not executables.
{allpkgs}: let
  pkgs = allpkgs.default;
  typescript = import ./typescript {inherit pkgs;};
in {
  all = [
    typescript
  ];
}
