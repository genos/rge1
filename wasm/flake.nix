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
      pkgs = import nixpkgs {inherit system;};
    in {
      packages.default = pkgs.stdenv.mkDerivation rec {
        name = "rge1";
        src = ./.;
        buildInputs = [ pkgs.wabt pkgs.deno ];
        buildPhase = "wat2wasm ${name}.wat";
        installPhase = "mkdir -p $out/bin; cp ${name}.ts $out/bin/${name}; cp ${name}.wasm $out/bin";
      };
    });
}
