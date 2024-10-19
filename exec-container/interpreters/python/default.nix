{pkgs}: {
  python311 = import ./3.11 {inherit pkgs;};
  python312 = import ./3.12 {inherit pkgs;};
}
