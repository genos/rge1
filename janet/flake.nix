{
  description = "Random ≥ 1 in Janet";

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
        buildInputs = [pkgs.janet pkgs.jpm];
        buildPhase = ''
          export JANET_PATH="$PWD/.jpm"
          export JANET_LIBPATH="${pkgs.janet}/lib"
          export JANET_BUILDPATH="$JANET_PATH/build"
          mkdir -p $JANET_BUILDPATH
          jpm build --optimize=3
        '';
        installPhase = "mkdir -p $out/bin; cp $JANET_BUILDPATH/${name} $out/bin";
      };
    });
}
