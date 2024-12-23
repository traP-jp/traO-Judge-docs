{ pkgs, allpkgs }:
let
  interpreters = import ./interpreters { inherit allpkgs; };
  compilers = import ./compilers { inherit allpkgs; };

  languagesArray = {
    languages = interpreters.traojudge ++ compilers.traojudge;
  };
  jsonOutput = builtins.toJSON languagesArray;
  jsonFile = pkgs.writeText "languages.json" jsonOutput;
in
  pkgs.stdenv.mkDerivation {
    name = "language-settings";
    nativeBuildInputs = [ pkgs.check-jsonschema ];
    srcs = [
      jsonFile
      ./schema.json
    ];
    unpackPhase = ''
      for _src in $srcs; do
        cp "$_src" $(stripHash "$_src")
      done
    '';
    dontBuild = true;
    doCheck = true;
    checkPhase = ''
      check-jsonschema --schemafile schema.json languages.json
    '';
    installPhase = ''
      mv languages.json $out
    '';
  }
