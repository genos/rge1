{
  description = "Random ≥ 1 in C++";

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
        buildInputs = [pkgs.clang_19 pkgs.pcg_c];
        buildPhase = "clang++ -Wall -Wextra -Ofast -march=native -std=c++2b -lpcg_random ${name}.cc -o ${name}";
        installPhase = "mkdir -p $out/bin; cp ${name} $out/bin";
      };
    });
}
