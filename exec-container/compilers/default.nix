{pkgs}: let
  golang = import ./golang {inherit pkgs;};
  brainfuck = import ./brainfuck {inherit pkgs;};
  rust = import ./rust {inherit pkgs;};
in {
  all = [
    golang
    brainfuck
    rust
  ];
}
