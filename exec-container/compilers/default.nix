{pkgs}: let
  golang = import ./golang {inherit pkgs;};
  brainfuck = import ./brainfuck {inherit pkgs;};
in {
  all = [
    golang
    brainfuck
  ];
}
