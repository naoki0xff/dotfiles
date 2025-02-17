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

  # Networking
  wsl.wslConf.network.generateResolvConf = true;

  # Use auto generated configuration as networking configuration
  #   or
  # Type bellow command in powershell and insert nameservers output to /etc/resolv.conf
  # (Get-DnsClientServerAddress -AddressFamily IPv4).ServerAddresses | ForEach-Object { "nameserver $_" }
  #networking.nameservers = [
  #  "x.x.x.x"
  #];
  #networking.search = [
  #  "some.domain.name"
  #];

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
