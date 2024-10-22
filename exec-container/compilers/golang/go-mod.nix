{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "go.mod template";
  src = ./.;
  phases = "installPhase";
  installPhase = ''
    mkdir -p $out/misc/go
    touch $out/misc/go/go.mod
    echo 'module gomod-template

    go 1.23.2

    require (
        github.com/emirpasic/gods v1.18.1
        github.com/gonum/gonum v0.15.1
        github.com/liyue201/gostl v1.2.0
        golang.org/x/exp v0.0.0-20241009180824-f66d83c29e7c
    )

    replace (
        github.com/emirpasic/gods => ${pkgs.myGoLibraries.gods}
        github.com/gonum/gonum => ${pkgs.myGoLibraries.gonum}
        github.com/liyue201/gostl => ${pkgs.myGoLibraries.gostl}
        golang.org/x/exp => ${pkgs.myGoLibraries.golang-org-exp}
    )
    ' > $out/misc/go/go.mod
  '';
}
