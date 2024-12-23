{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Kubernetes
    argocd
    devcontainer
    istioctl
    #kind
    kubectl
    kubectx
    kubernetes-helm
    kubeseal
    kyverno

    # Terraform
    tenv
    tflint

    # Security
    datree
    trivy

    # Cloud
    awscli2
    azure-cli
    kubelogin # Azure AKS utility

    # Misc
    bat
    colordiff
    direnv
    fd
    fzf
    jq
    nkf
    ripgrep
    tree
    tmux
  ];
}
