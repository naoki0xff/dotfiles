
{ self, inputs, system, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # C family
    clang-tools
    gcc

    # Node JS
    # You cannot install npm/yarn packages globally with nix way due to its permission restriction.
    # Please add "prefix" configration on your ${HOME}/.npmrc to install npm/yarn packages under user's permission.
    nodejs_23 # npm is bundled
    yarn

    # PHP
    php84
    php84Packages.composer

    # Java
    # https://nixos.wiki/wiki/Java
    jdk21_headless
    maven
    gradle

    # Rust
    cargo

    # Terraform
    tenv
    tflint
  ];
}
