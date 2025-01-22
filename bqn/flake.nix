{
  description = "rge1 in BQN";

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
      packages.default = pkgs.writeShellApplication {
        name = "rge1";
        text = "${pkgs.cbqn}/bin/bqn ./rge1.bqn";
      };
    });
}
