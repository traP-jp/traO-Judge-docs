{pkgs}: let
  myGcc = pkgs.gcc;

  gccScript = pkgs.writeShellScriptBin "gcc" "exec ${myGcc}/bin/gcc $@";
in
  gccScript
  // {
    traojudge = {
      languages = [
        {
          binName = "gcc";
          compile = cfg: "${gccScript}/bin/gcc -o ${cfg.out} ${cfg.src}";
          name = "C";
          run = cfg: "exec ${cfg.out}";
        }
      ];
    };
  }
