{ self, inputs, username, system, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    # NOTE: Now below lines are migrated to "../home/aarch64-darwin/default.nix".
    #interactiveShellInit = ''
    #  . "/etc/profiles/per-user/${username}/etc/profile.d/hm-session-vars.sh"
    #'';
  };
  environment.systemPackages = with pkgs; [
    # Terminal Emulater
    tmux
  ];
}
