{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Shell
    bat
    colordiff
    direnv
    tmux

    # Container
    argocd
    devcontainer
    istioctl
    #kind
    kubectl
    kubectx
    kubernetes-helm
    kyverno

    # Security
    trivy

    # Misc
    fd
    fzf
    jq
    ripgrep
    tree
  ];
}
