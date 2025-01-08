{ self, inputs, system, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Editor
    neovim

    # Launguage Server
    bash-language-server
    dockerfile-language-server-nodejs
    helm-ls
    jdt-language-server # Java
    lemminx # XML
    lua-language-server
    nil # Nix
    phpactor
    pyright # Python
    terraform-ls
    typescript-language-server
    yaml-language-server
  ];
}
