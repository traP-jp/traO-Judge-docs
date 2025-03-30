{pkgs, ...}: let
  myBrainfuck = pkgs.bfc;
  myClang = pkgs.clang;
in
  pkgs.writeShellScriptBin "bfc" "PATH=${myClang}/bin:$PATH exec ${myBrainfuck}/bin/bfc $@"
  // {
    traojudge = {
      name = "Brainfuck";
      binName = "bfc";
      compile = cfg: "${myBrainfuck} \"$SRC\"";
      run = cfg: "exec \"$DIST\""; # TODO: bfcは出力ファイルを指定できなさそうなので、これは変えないといけない
    };
  }
