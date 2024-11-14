{pkgs}: let
  myPwsh = pkgs.powershell;
in
  pkgs.writeShellScriptBin "pwsh" "exec ${myPwsh}/bin/pwsh $@"
