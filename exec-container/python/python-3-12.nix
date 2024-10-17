{
  pkgs, filter, ...
}:
let
  python = pkgs.python312.withPackages (
    python-pkgs: with python-pkgs; [
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
    ]
  );
in
  pkgs.stdenv.mkDerivation {
    name = "python312";
    src = filter {
      root = python;
      include = [
        "bin/python3.12"
      ];
    };
    phases = "installPhase";
    installPhase = ''
      ln -s $src $out
    '';
  }