{pkgs}: let
  myNode = pkgs.nodejs_22;
  myNpmPackage = pkgs.importNpmLock.buildNodeModules {
    npmRoot = ./.;
    nodejs = myNode;
  };
in
  pkgs.stdenv.mkDerivation {
    name = "typescript node_modules";
    src = ./.;
    buildInputs = [myNpmPackage];
    installPhase = ''
      mkdir -p $out/misc/typescript
      ln -s ${myNpmPackage}/* $out/misc/typescript
    '';
  }
