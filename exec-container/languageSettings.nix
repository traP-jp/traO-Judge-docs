{
  pkgs,
  allpkgs,
}: let
  interpreters = import ./interpreters {inherit allpkgs;};
  compilers = import ./compilers {inherit allpkgs;};

  cfg = {
    src = "$TRAOJUDGE_BUILD_SOURCE";
    out = "$TRAOJUDGE_BUILD_OUTPUT";
    temp = "$TRAOJUDGE_BUILD_TEMPDIR";
  };
  languagesArray = {
    languages = builtins.map (lang: lang // {
      compile = lang.compile cfg;
      run = lang.run cfg;
    }) (interpreters.traojudge ++ compilers.traojudge);
  };
  jsonOutput = builtins.toJSON languagesArray;
  jsonFile = pkgs.writeText "languages.json" jsonOutput;
in
  pkgs.stdenv.mkDerivation {
    name = "language-settings";
    nativeBuildInputs = [pkgs.check-jsonschema];
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
