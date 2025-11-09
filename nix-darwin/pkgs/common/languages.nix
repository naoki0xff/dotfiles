{ self, inputs, username, system, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Node JS
    # You cannot install npm/yarn packages globally with nix way due to its permission restriction.
    # Please add "prefix" configration on your ${HOME}/.npmrc to install npm/yarn packages under user's permission.
    nodejs_24 # npm is bundled
    yarn

    # PHP
    php84
    php84Packages.composer

    # Java
    # https://nixos.wiki/wiki/Java
    jdk21_headless
    maven
    gradle

    # Golang
    go

    # Rust
    cargo

    # Python
    python313
    python313Packages.pip

    # Terraform
    tenv
    tflint
    terraform-docs 
  ];
}
