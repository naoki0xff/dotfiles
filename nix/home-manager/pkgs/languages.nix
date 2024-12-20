{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nodejs_23
    # You cannot install npm package globally with nix way with permission issue.
    # Please add "prefix" configration on your ${HOME}/.npmrc to install npm packages under user's permission.
  ];
}
