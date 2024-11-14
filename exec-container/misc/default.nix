# Files which is not executables.
{pkgs}: let
  typescript = import ./typescript {inherit pkgs;};
in {
  all = [
    typescript
  ];
}
