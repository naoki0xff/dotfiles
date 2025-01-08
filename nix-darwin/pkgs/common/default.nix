{ self, inputs, system, pkgs, ... }:

{
  # Check available nixpkgs   => https://search.nixos.org/packages
  # List of available modules => https://github.com/NixOS/nixpkgs/tree/master/nixos/modules
  imports = [
    ./cloud.nix
    ./container.nix
    ./neovim.nix
    ./languages.nix
    ./shell.nix
    ./utils.nix
  ];
}
