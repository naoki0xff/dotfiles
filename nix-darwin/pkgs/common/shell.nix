{ self, inputs, username, system, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    #interactiveShellInit = ''
    #  . "/etc/profiles/per-user/${username}/etc/profile.d/hm-session-vars.sh"
    #'';
  };
  environment.systemPackages = with pkgs; [
    # Terminal Emulater
    tmux
  ];
}
