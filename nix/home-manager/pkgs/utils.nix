{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    devcontainer
    direnv
    fd
    fzf
    ripgrep
    trivy
  ];
}
