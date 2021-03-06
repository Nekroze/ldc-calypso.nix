# ldc-calypso.nix

[Nix][1] package for [LDC][2] [Syniurge/Calypso][3] fork which allows direct import of C++ code from [dlang][4].

## Usage

This requires the [Nix][1] package manager for reproducable builds.

### Building ldc on its own

```shell
$ git clone https://github.com/Nekroze/ldc-calypso.nix.git
$ cd ldc-calypso.nix
$ nix-build
$ ./result/bin/ldc2 --help
```

### As a nix dependency

```shell
$ cat default.nix
```
```nix
{ nixpkgs ? import <nixpkgs> {} }:

with nixpkgs;

let
  ldc = import ./ldc-calypso.nix {};
in stdenv.mkDerivation rec {
  name = "my-project-${version}";
  version = "0.0.1";

  src = ./.;

  buildInputs = [ldc];
  
  buildPhase = ''
    ldc2 --help
  '';
}
```
[1]: https://www.nixos.org/nix/
[2]: https://github.com/ldc-developers
[3]: https://github.com/Syniurge/Calypso
[4]: https://dlang.org/
