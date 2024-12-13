{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.trivy
  ];
}
