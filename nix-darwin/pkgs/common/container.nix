{ self, inputs, system, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Container
    # podman => ../aarch64-darwin/homebrew.nix

    # Local Cluster
    kind

    # Kubernetes
    argocd
    istioctl
    kubectl
    kubectx
    kubernetes-helm
    kubeseal
    kyverno
  ];
}
