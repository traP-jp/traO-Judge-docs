{pkgs}: let
  myGcc = pkgs.gcc;
in
  pkgs.writeShellScriptBin "gcc" "exec ${myGcc}/bin/gcc $@"
  // {
    traojudge = {
      languages = [
        {
          binName = "gcc";
          compile = "${myClang}/bin/gcc -o $OUT $SRC";
          name = "C";
          run = "$OUT";
        }
      ];
    };
  }
