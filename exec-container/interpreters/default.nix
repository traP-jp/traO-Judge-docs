{pkgs}: let
  python = import ./python {inherit pkgs;};
  bash = import ./bash {inherit pkgs;};
  sed = import ./sed {inherit pkgs;};
  node = import ./node {inherit pkgs;};
  seed7 = import ./seed7 {inherit pkgs;};
in {
  all = [
    python.python311
    python.python312
    python.python312-quantum
    bash
    sed
    node
    seed7
  ];
}
