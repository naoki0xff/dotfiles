{ self, inputs, system, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Terminal Emulater
    tmux
  ];
}
