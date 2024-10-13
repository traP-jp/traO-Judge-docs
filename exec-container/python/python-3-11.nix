{
  pkgs, bin_link_drv, ...
}: bin_link_drv {
  drv = pkgs.python311.withPackages ( python-pkgs: with python-pkgs; [
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
  sources = [
    { path = "bin/python3.11"; alias = "python3.11"; }
  ];
}