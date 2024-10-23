{
  lib,
  writeShellScriptBin,
  gmp,
  gcc14,
  ac-library,
  boost186,
  eigen,
}:
writeShellScriptBin "gcc" ''
  export LIBRARY_PATH="${lib.makeLibraryPath [gmp]}"
  exec ${gcc14}/bin/g++ \
    -I ${ac-library}/include \
    -I ${boost186.dev}/include \
    -L ${boost186}/lib \
    -I ${eigen}/include/eigen3 \
    -lgmpxx -lgmp \
    $@
''
