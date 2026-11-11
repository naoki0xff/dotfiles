{ self, inputs, system, pkgs, ... }:

{
  # Configure MacOS native functionality
  system.defaults.dock = {
    autohide = true;
    orientation = "bottom";
    magnification = true;
  };
}
