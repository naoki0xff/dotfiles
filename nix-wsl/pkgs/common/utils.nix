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

    # JSON/YAML/XML/TOML
    jq
    yq

    # Previewer
    glow

    # Misc
    bat
    colordiff
    nkf
    tree
    wget
    unzip
  ];
}
