{pkgs}: let
  golang = import ./golang {inherit pkgs;};
  brainfuck = import ./brainfuck {inherit pkgs;};
  rust = import ./rust {inherit pkgs;};
  koka = import ./koka {inherit pkgs;};
  mercury = import ./mercury {inherit pkgs;};
  cobol = import ./cobol {inherit pkgs;};
  haxe = import ./haxe {inherit pkgs;};
in {
  all = [
    golang
    brainfuck
    rust
    koka
    mercury
    cobol
    haxe
  ];
}
