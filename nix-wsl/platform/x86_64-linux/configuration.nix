{ self, inputs, username, system, pkgs, ... }:

# See NixOS-WSL configuration options
# => https://nix-community.github.io/NixOS-WSL/options.html
{
  imports = [
    # include NixOS-WSL modules
    <nixos-wsl/modules>

    # Systemd
    ./systemd/docker.nix
  ];

  wsl.enable = true;
  wsl.defaultUser = "nixos";

  wsl.wslConf.network.generateResolvConf = false;
  networking.nameservers = [
    "8.8.8.8"
  ];

  nix = {
    settings = {
      experimental-features = "nix-command flakes";
    };
    # Storage Optimization
    optimise = {
      automatic = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  system.stateVersion = "24.05";

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "${system}";
}
