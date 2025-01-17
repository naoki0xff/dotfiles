{ self, inputs, system, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Container
    # podman => ../aarch64-darwin/brew.nix

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
