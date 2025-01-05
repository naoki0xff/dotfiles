{ self, inputs, system, pkgs, ... }:

{
  imports = [
    ./cloud.nix
    ./container.nix
    ./editor.nix
    ./languages.nix
    ./shell.nix
    ./utils.nix
  ];
}
