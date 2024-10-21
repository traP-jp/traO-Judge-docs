{pkgs}: let
  python = import ./python {inherit pkgs;};
in {
  all = [
    python.python311
    python.python312
  ];
}
