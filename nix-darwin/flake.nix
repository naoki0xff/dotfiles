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
    system = "aarch64-darwin";
    username = "naoki";

    pkgs = nixpkgs.legacyPackages.${system};

    configuration = { system, pkgs, ... }: {
      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "${system}";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#${username}@${system}
    darwinConfigurations."${username}@${system}" = nix-darwin.lib.darwinSystem {
      inherit pkgs;
      modules = [
        # Darwin Configurations
        configuration
        #なんかこいつ(configuration)を別ファイルに分割するとビルドが通らなかった。困る。
        #./platform/${system}.nix
        ./pkgs/common/default.nix
        ./pkgs/${system}/default.nix
        ./pkgs/${system}/brew.nix
      ];
      specialArgs = { inherit self inputs system; };
    };
  };
}
