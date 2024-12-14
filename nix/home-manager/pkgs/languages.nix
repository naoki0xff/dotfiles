{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nodejs_23
    #nodePackages.neovim
  ];
}
