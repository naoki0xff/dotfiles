{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Node JS
    nodejs_23 # npm is bundled
    yarn
    # You cannot install npm/yarn packages globally with nix way due to its permission restriction.
    # Please add "prefix" configration on your ${HOME}/.npmrc to install npm/yarn packages under user's permission.

    # Others
  ];
}
