{ self, inputs, system, pkgs, ... }:

{
  imports = [
    ./cloud.nix
    ./container.nix
    ./editor.nix
    ./git.nix
    ./languages.nix
    ./shell.nix
    ./utils.nix
  ];
}
