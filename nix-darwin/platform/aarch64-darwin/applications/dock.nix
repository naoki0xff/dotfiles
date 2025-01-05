{ self, inputs, system, pkgs, ... }:

{
  system.defaults.dock = {
    autohide = true;
    orientation = "bottom";
    magnification = true;
  };
}
