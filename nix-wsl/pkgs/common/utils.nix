{ self, inputs, system, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Devlopment Support
    devcontainer
    direnv
    
    # Finder
    fd
    fzf

    # Grep
    ripgrep

    # JSON
    jq

    # Previewer
    glow

    # Misc
    bat
    colordiff
    nkf
    tree
    unzip
  ];
}
