{ self, inputs, username, system, localhostname, pkgs, ... }:

{
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
      interval = { Weekday = 0; Hour = 0; Minute = 0; };
      options = "--delete-older-than 30d";
    };
  };

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "${system}";

  networking.hostName = "${localhostname}";

  imports = [
    #./applications/dock.nix
  ];
}
