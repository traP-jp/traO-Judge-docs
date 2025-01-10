{pkgs}:
let
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
  } // {
    traojudge = {
      languages = [
        {
          binName = "java";
          compile = ''
            ln -s $SRC $DEST/Main.java
            ${openjdk}/bin/javac $DEST/Main.java
          '';
          name = "Java";
          run = "${openjdk}/bin/java $DEST/Main";
        }
      ];
    };
  }
  