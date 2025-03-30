{pkgs}: let
  myGcc = pkgs.gcc;
in
  pkgs.writeShellScriptBin "gcc" "exec ${myGcc}/bin/gcc $@"
  // {
    traojudge = {
      languages = [
        {
          binName = "gcc";
          compile = cfg: "${myGcc}/bin/gcc -o ${cfg.out} ${cfg.src}";
          name = "C";
          run = cfg: "exec ${cfg.out}";
        }
      ];
    };
  }
