{ self, inputs, system, pkgs, ... }:

{
  imports = [
    ./misc.nix
    ./network.nix
    ./xdg-utils.nix
  ];
}
