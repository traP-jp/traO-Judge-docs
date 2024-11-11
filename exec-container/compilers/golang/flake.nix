{
  inputs = {
    gods = {
      url = "github:emirpasic/gods/v1.18.1";
      flake = false;
    };
    gonum = {
      url = "github:gonum/gonum/v0.15.1";
      flake = false;
    };
    gostl = {
      url = "github:liyue201/gostl/v1.2.0";
      flake = false;
    };
    golang-org-exp = {
      # No version tag available in the repository. (v0.0.0-20241009180824-f66d83c29e7c)
      url = "github:golang/exp/225e2abe05e664228e7afb6bf5b97a25d56ba575";
      flake = false;
    };
  };

  outputs = {
    self,
    gods,
    gonum,
    gostl,
    golang-org-exp,
    ...
  }: {
    drv = {pkgs, ...}: let
      compiler-drv = let
        goCompiler = pkgs.go;
      in
        pkgs.writeShellScriptBin "go" "exec ${goCompiler}/share/go/bin/go $@";
      mod-drv = pkgs.stdenv.mkDerivation {
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
              github.com/emirpasic/gods => ${gods}
              github.com/gonum/gonum => ${gonum}
              github.com/liyue201/gostl => ${gostl}
              golang.org/x/exp => ${golang-org-exp}
          )
          ' > $out/misc/go/go.mod
        '';
      };
    in
      pkgs.symlinkJoin {
        name = "golang";
        paths = [compiler-drv mod-drv];
      };
  };
}
