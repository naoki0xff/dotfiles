{ self, inputs, username, system, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # virtual env
    devcontainer
    devenv

    # shell integration
    direnv
  ];
}
