{allpkgs}: let
  pkgs = allpkgs.default;
  golang = import ./golang {inherit pkgs;};
  brainfuck = import ./brainfuck {inherit pkgs;};
  rust = import ./rust {inherit pkgs;};
  koka = import ./koka {inherit pkgs;};
  mercury = import ./mercury {inherit pkgs;};
  cobol = import ./cobol {inherit pkgs;};
  haxe = import ./haxe {inherit pkgs;};
  raku = import ./raku {pkgs = allpkgs.release2411;};
in {
  all = [
    golang
    brainfuck
    rust
    koka
    mercury
    cobol
    haxe
    raku
  ];
}
