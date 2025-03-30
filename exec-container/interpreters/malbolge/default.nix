{pkgs}: let
  malbolge = pkgs.stdenv.mkDerivation {
    name = "malbolge";
    src = ./.;
    nativeBuildInputs = [
      pkgs.gcc
    ];
    buildPhase = ''
      gcc -o malbolge malbolge.c
    '';
    installPhase = ''
      mkdir -p $out/bin
      cp malbolge $out/bin
    '';
  };
in
  malbolge
  // {
    traojudge = {
      languages = [
        {
          binName = "malbolge";
          compile = cfg: "";
          name = "Malbolge";
          run = cfg: "${malbolge}/bin/malbolge \"${cfg.src}\"";
        }
      ];
    };
  }
