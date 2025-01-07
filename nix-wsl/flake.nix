{
  description = "NixOS configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{
    self,
    nixpkgs,
    home-manager,
    ...
  }:
  let
    username = "nixos";
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    # sudo nixos-rebuild switch --flake .#naoki@x86_64-linux --impure
    nixosConfigurations."${username}@${system}" = nixpkgs.lib.nixosSystem {
      inherit pkgs;
      specialArgs = { inherit self inputs username system; };
      modules = [
        ./platform/${system}/configuration.nix
        ./platform/${system}/hardware-configuration.nix
        ./pkgs/common/default.nix
        ./pkgs/${system}/default.nix

        # Home Manager Configurations
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          users.users.${username} = {
	    home = "/home/${username}"; # Your home directory
	    isNormalUser = true;
            shell = pkgs.zsh;
	  };
          home-manager.users.${username} = import ./home/${system}/default.nix; # Your user name
          home-manager.extraSpecialArgs = { inherit self inputs username system; };
        }
      ];
    };
  };
}
