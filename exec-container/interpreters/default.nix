{pkgs}: let
  python = import ./python {inherit pkgs;};
  bash = import ./bash {inherit pkgs;};
in {
  all = [
    python.python311
    python.python312
    bash
  ];
}
