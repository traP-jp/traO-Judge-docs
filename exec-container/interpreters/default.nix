{allpkgs}: let
  pkgs = allpkgs.default;
  python = import ./python {inherit pkgs;};
  bash = import ./bash {inherit pkgs;};
  sed = import ./sed {inherit pkgs;};
  node = import ./node {inherit pkgs;};
  seed7 = import ./seed7 {inherit pkgs;};
  pwsh = import ./powershell {inherit pkgs;};
  # sagemath = import ./sagemath {inherit pkgs;};
  awk = import ./awk {inherit pkgs;};
  whitespace = import ./whitespace {inherit pkgs;};
  unison = import ./unison {inherit pkgs;};
  zsh = import ./zsh {inherit pkgs;};
  lua = import ./lua {inherit pkgs;};
  r = import ./r {inherit pkgs;};
  prolog = import ./prolog {inherit pkgs;};
  malbolge = import ./malbolge {inherit pkgs;};
in {
  all = [
    python.python311
    python.python312
    python.python312-quantum
    bash
    sed
    node
    seed7
    pwsh
    # sagemath
    awk
    whitespace
    unison
    zsh
    lua
    r
    prolog
    malbolge
  ];
  traojudge =
    [
      python.python311.traojudge
      python.python312.traojudge
      python.python312-quantum.traojudge
      #bash.traojudge
      #sed.traojudge
      #node.traojudge
      #seed7.traojudge
      #pwsh.traojudge
      ## sagemath.traojudge
      #awk.traojudge
      #whitespace.traojudge
      #unison.traojudge
      #zsh.traojudge
      #lua.traojudge
      #r.traojudge
      #prolog.traojudge
    ]
    ++ malbolge.traojudge.languages;
}
