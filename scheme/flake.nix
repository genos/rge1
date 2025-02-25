{
  description = "Random ≥ 1 in Chez Scheme";

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
      packages.default = pkgs.writeShellApplication rec {
        name = "rge1";
        text = "${pkgs.chez}/bin/scheme --script ${name}.scm";
      };
    });
}
