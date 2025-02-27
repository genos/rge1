{
  description = "Random ≥ 1 in C";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = {
    self,
    flake-utils,
    nixpkgs,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      packages.default = pkgs.stdenv.mkDerivation rec {
        name = "rge1";
        src = ./.;
        buildInputs = [pkgs.clang_19];
        buildPhase = "clang -Wall -Wextra -O3 -ffast-math -std=c2x ${name}.c -o ${name}";
        installPhase = "mkdir -p $out/bin; cp ${name} $out/bin";
      };
    });
}
