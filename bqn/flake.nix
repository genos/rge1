{
  description = "Random ≥ 1 in BQN";

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
      packages.default = pkgs.writeShellApplication rec {
        name = "rge1";
        text = "${pkgs.cbqn}/bin/bqn ${name}.bqn";
      };
    });
}
