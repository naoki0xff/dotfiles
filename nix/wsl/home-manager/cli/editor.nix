{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.neovim
    #pkgs.nodePackages.neovim
  ];
}
