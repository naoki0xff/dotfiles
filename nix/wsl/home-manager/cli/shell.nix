{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.direnv
  ];
}
