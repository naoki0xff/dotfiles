{ self, inputs, system, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Editor
    inputs.neovim-nightly-overlay.packages.${pkgs.system}.default

    # Container
    devcontainer

    # Kubernetes
    argocd
    istioctl
    kind
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
    glow
    jq
    nkf
    ripgrep
    tree
    tmux
  ];
}
