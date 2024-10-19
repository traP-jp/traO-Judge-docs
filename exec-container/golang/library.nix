{
  pkgs, ...
}:
let
  gods = builtins.fetchGit {
    url = "https://github.com/emirpasic/gods";
    rev = "dbdbadc158ae6b453820b3cfb8c6cb48be4d7ddf"; # v1.18.1
  };
  gonum = builtins.fetchGit {
    url = "https://github.com/gonum/gonum";
    rev = "bdcda9a453049449163d160b98285b64ec8093a1"; # v0.15.1
  };
  gostl = builtins.fetchGit {
    url = "https://github.com/liyue201/gostl";
    rev = "98dc0eb1ce1063cf860342e7e890760fcb711e3b"; # v1.2.0
  };
  golang-org-x-exp = builtins.fetchGit {
    url = "https://github.com/golang/exp";
    rev = "225e2abe05e664228e7afb6bf5b97a25d56ba575"; # v0.0.0-20241009180824-f66d83c29e7c (via GitHub)
  };
in
  pkgs.stdenv.mkDerivation {
    name = "go-library";
    description = "Libraries for Go";
    phases = "installPhase";
    byuidInputs = [
      gods
      gonum
      gostl
      golang-org-x-exp
    ];
    src = ./.;
    installPhase = ''
      mkdir -p $out/cache/go
      ln -s ${gods} $out/cache/go/gods
      ln -s ${gonum} $out/cache/go/gonum
      ln -s ${gostl} $out/cache/go/gostl
      ln -s ${golang-org-x-exp} $out/cache/go/exp
    '';
  }