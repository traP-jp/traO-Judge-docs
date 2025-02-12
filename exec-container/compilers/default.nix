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
  java = import ./java {pkgs = allpkgs.release2411;};
  gcc = import ./gcc {inherit pkgs;};
  gxx = import ./g++ {inherit pkgs;};
  clang = import ./clang {pkgs = allpkgs.release2411;};
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
    java
    gcc
    gxx
    clang
  ];
  traojudge =
    [
      #golang.traojudge
      brainfuck.traojudge
      #rust.traojudge
      #koka.traojudge
      #mercury.traojudge
      #cobol.traojudge
      #haxe.traojudge
      #raku.traojudge
    ]
    ++ java.traojudge.languages
    ++ clang.traojudge.languages;
  #++ gcc.traojudge.languages;
  #++ gxx.traojudge.languages;
}
