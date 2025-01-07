{ self, inputs, system, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # AWS
    awscli2

    # Azure
    azure-cli
    kubelogin # Azure AKS utility
  ];
}
