{
  # expect nixpkgs
  pkgs, ...
}:{
  # expect derivation, list[{path: string, alias: string}]
  drv, sources, ...
}:
let
  path_bash_list =
    "("
    + builtins.concatStringsSep " " (map (source: source.path) sources)
    + ")";
  alias_bash_list =
    "("
    + builtins.concatStringsSep " " (map (source: source.alias) sources)
    + ")";
  list_length = builtins.toString (builtins.length sources);
in
  pkgs.stdenv.mkDerivation
{
  name = "bin-flatten";
  buildInputs = [ drv pkgs.bash ];
  phases = "installPhase";
  installPhase = ''
    #!${pkgs.bash}/bin/bash
    mkdir -p $out/linked-bin
    aliases=${alias_bash_list}
    pathes=${path_bash_list}
    length=${list_length}
    for i in $(seq 0 $(($length - 1))); do
      alias=$(echo $aliases | cut -d' ' -f$(($i + 1)))
      path=$(echo $pathes | cut -d' ' -f$(($i + 1)))
      target=$out/linked-bin/$alias
      source=$drv/$path
      if [ -e $target ]; then
        echo "Error: $target already exists"
        exit 1
      fi
      ln -s $source $target
    done
  '';
}
