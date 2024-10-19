{
  pkgs, filter, ...
}:
let
  golang = pkgs.go;
in
  pkgs.stdenv.mkDerivation {
    name = "golang";
    src = filter {
      root = golang;
      /*
       */
      include = [
        "share/go/bin/go"
      ];
    };
    phases = "installPhase";
    installPhase = ''
      mkdir -p $out/bin
      ln -s $src/share/go/bin/go $out/bin/go
    '';
  }