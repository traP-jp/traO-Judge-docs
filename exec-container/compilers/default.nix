{pkgs}: let
  golang = import ./golang {inherit pkgs;};
in {
  all = [
    golang
  ];
}
