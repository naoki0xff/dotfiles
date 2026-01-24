{ self, inputs, username, system, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Editor
    neovim

    # parser
    tree-sitter
    
    # Launguage Server
    bash-language-server              # Bash
    dockerfile-language-server-nodejs # Docker
    gopls                             # Go
    helm-ls                           # Helm
    jdt-language-server               # Java
    lemminx                           # XML
    lua-language-server               # Lua
    nil                               # Nix
    phpactor                          # PHP
    pyright                           # Python
    rubyPackages.solargraph           # Ruby
    terraform-ls                      # Terraform
    typescript-language-server        # Javascript/Typescript
    yaml-language-server              # YAML
  ];
}
