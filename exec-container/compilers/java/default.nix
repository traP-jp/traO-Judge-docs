{pkgs}: let
  openjdk = pkgs.jdk23;
in
  pkgs.stdenv.mkDerivation {
    name = "java";
    buildInput = [openjdk];
    src = ./.;
    installPhase = ''
      mkdir -p $out/bin
      ln -s ${openjdk}/bin/java $out/bin/java
      ln -s ${openjdk}/bin/javac $out/bin/javac
    '';
  }
  // {
    traojudge = {
      languages = [
        {
          binName = "java";
          compile = cfg: ''
            ln -s ${cfg.src} ${cfg.out}/Main.java
            ${openjdk}/bin/javac ${cfg.out}/Main.java
          '';
          name = "Java";
          run = cfg: "${openjdk}/bin/java ${cfg.out}/Main";
        }
      ];
    };
  }
