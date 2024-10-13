{
  # expect nixpkgs
  pkgs, ...
}:{
  # expect list[derivation]
  drvs, ...
}:
pkgs.stdenv.mkDerivation
{
  name = "bin-flatten";
  buildInputs = drvs ++ [ pkgs.bash ];
  phases = "installPhase";
  installPhase = ''
    #!${pkgs.bash}/bin/bash
    mkdir -p $out/linked-bin
    for drv_with_doublequote in \"${
      pkgs.lib.foldl (acc: elem: if acc == "" then elem else acc + " " + elem) "" drvs
    }\"; do
      drv=$(echo $drv_with_doublequote | tr -d '"')
      for bin in $(find $drv/linked-bin -mindepth 1 -maxdepth 1); do
        basename=$(basename $bin)
        target=$out/linked-bin/$basename
        if [ -e $target ]; then
          echo "Error: $target already exists"
          exit 1
        fi
        ln -s $bin $target
      done
    done
  '';
}
