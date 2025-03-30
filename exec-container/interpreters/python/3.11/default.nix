{pkgs}: let
  myPython = pkgs.python311.withPackages (ps:
    with ps; [
      numpy
      scipy
      networkx
      sympy
      sortedcontainers
      more-itertools
      shapely
      bitarray
      pulp
      mpmath
      pandas
      z3-solver
      scikit-learn
    ]);
in
  pkgs.writeShellScriptBin "python3.11" "exec ${myPython}/bin/python $@"
  // {
    traojudge = {
      name = "Python3.11";
      binName = "python3.11";
      compile = cfg: "${pkgs.coreutils}/bin/cp ${cfg.src} ${cfg.out}/main.py";
      run = cfg: "exec ${myPython}/bin/python ${cfg.out}/main.py";
      #libraries = [
      #  バージョンが指定されていないので書けない
      #]
    };
  }
