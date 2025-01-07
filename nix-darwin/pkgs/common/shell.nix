{ self, inputs, system, pkgs, ... }:

{
  programs.zsh.enable = true;
  environment.systemPackages = with pkgs; [
    # Terminal Emulater
    tmux
  ];
}
