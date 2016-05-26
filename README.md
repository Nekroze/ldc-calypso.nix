# ldc-calypso.nix
Nix package for ldc Syniurge/Calypso fork

## Usage

This requires the [Nix][1] package manager for reproducable builds.

### Building ldc on its own

```shell
$ git clone https://github.com/Nekroze/ldc-calypso.nix
$ nix-build ldc-calypso.nix
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
