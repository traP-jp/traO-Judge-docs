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
