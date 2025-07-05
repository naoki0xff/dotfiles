{ self, inputs, username, system, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # AWS
    awscli2

    # Azure
    azure-cli
    bicep # incl. Bicep.LangServer
    kubelogin # Azure AKS utility
  ];
}
