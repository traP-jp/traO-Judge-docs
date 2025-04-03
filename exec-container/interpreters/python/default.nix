{pkgs}: {
  python311 = import ./3.11 {inherit pkgs;};
  python312 = import ./3.12 {inherit pkgs;};
  python312-quantum = import ./3.12-quantum {inherit pkgs;};
  python312-traopy-util = import ./3.12-traopy-util {inherit pkgs;};
}
