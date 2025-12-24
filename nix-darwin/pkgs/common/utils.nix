{ self, inputs, system, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
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

    # Vulnerability Detection
    datree
    trivy

    # CI/CD
    reviewdog

    # Misc
    bat
    colordiff
    nkf
    rename
    tree
    wget
    unzip
  ];
}
