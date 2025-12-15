{
  description = "Random ≥ 1 in WASM";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
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
        buildInputs = [pkgs.binaryen pkgs.deno];
        buildPhase = "wasm-as ${name}.wat && wasm-opt -O4 ${name}.wasm -o ${name}.wasm";
        installPhase = "mkdir -p $out/bin && cp ${name}.ts $out/bin/${name} && cp ${name}.wasm $out/bin";
      };
    });
}
