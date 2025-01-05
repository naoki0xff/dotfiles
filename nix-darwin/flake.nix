{
  description = "Nix-darwin configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # Nix Darwin
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{
    self,
    nixpkgs,
    nix-darwin,
    ...
  }:
  let
    # Fix here to your preference
    username = "naoki";
    system = "aarch64-darwin";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#${username}@${system}
    darwinConfigurations."${username}@${system}" = nix-darwin.lib.darwinSystem {
      inherit pkgs;
      specialArgs = { inherit self inputs system; };
      modules = [
        # Nix Configuration
        ./platform/${system}/configuration.nix

        # Hardware Configuration
        #./platform/${system}/hardware-configuration.nix

        # Install Packages
        ./pkgs/common/default.nix
        ./pkgs/${system}/default.nix
      ];
    };
  };
}
