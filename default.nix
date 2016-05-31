{ nixpkgs ? import <nixpkgs> {} }:

with nixpkgs;

stdenv.mkDerivation rec {
  name = "ldc-calypso-${version}";
  version = "0.17.1";

  src = fetchgit {
    url = "https://github.com/Syniurge/Calypso.git";
    rev = "648a62f15a2b9db98e077bc930ad34c2370f8fbe";
    sha256 = "0c3zplwh7xh8fz3anfrvpaqd93x6ddvgn51y1q87sa06n0dw8x6v";
    fetchSubmodules = true;
  };

  buildInputs = [cmake libconfig libxml2 llvm_36];

  enableParallelBuilding = true;
  cmakeFlags = [
    "-DBUILD_SHARED_LIBS=ON"
    ''-DD_CFLAGS="-cpp-args -I${stdenv.cc.cc}/include"''
  ];

  patches = [
    ./math.patch
  ];

  #postPatch = ''
  #  sed -i 's|set(dc_flags --output-o)|set(dc_flags --output-o -cpp-args -I${stdenv.cc.cc}/include/c++/5.3.0)|g' runtime/CMakeLists.txt
  #'';
}
