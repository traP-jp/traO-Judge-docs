{pkgs}: let
  golang = import ./golang {inherit pkgs;};
  cpp = import ./cpp {inherit pkgs;};
in {
  all = [
    golang
    cpp
  ];
}
