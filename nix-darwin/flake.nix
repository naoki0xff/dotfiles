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

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{
    self,
    nixpkgs,
    nix-darwin,
    home-manager,
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
      specialArgs = { inherit self inputs username system; };
      modules = [
        # Nix Configuration
        ./platform/${system}/configuration.nix

        # Hardware Configuration
        #./platform/${system}/hardware-configuration.nix

        # Install Packages
        ./pkgs/common/default.nix
        ./pkgs/${system}/default.nix

        # Home Manager Configurations
        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          users.users.${username}.home = "/Users/${username}"; # Your home directory
          home-manager.users.${username} = import ./home/aarch64-darwin/default.nix; # Your user name
          home-manager.extraSpecialArgs = { inherit self inputs username system; };
        }
      ];
    };
  };
}
