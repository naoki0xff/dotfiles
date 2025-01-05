{ self, inputs, system, pkgs, ... }:

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
  system.stateVersion = 5;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "${system}";

  imports = [
    #./applications/dock.nix
  ];
}
