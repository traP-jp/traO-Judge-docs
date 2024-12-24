{pkgs}: let
  myPython = pkgs.python312.withPackages (ps:
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
  pkgs.writeShellScriptBin "python3.12" "exec ${myPython}/bin/python $@"
  // {
    traojudge = {
      name = "Python3.12";
      binName = "python3.12";
      compile = "cp \"$SRC\" \"$DIST\"";
      run = "exec ${myPython}/bin/python \"$DIST\"";
      #libraries = [
      #  バージョンが指定されていないので書けない
      #]
    };
  }
