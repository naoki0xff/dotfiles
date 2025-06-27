{ self, inputs, username, system, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodePackages.aws-cdk
  ];
}
