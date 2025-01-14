{ self, inputs, system, pkgs, ... }:

{
  imports = [
    ./network.nix
    ./xdg-utils.nix
  ];
}
