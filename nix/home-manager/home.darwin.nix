{ config, pkgs, ... }:

{
  # HOME Config
  home = {
    username = "naoki";
    homeDirectory = "/Users/naoki";

    # Dotfile management
    file = {
      ".npmrc".source = dotfiles/npmrc;
      ".tmux.conf".source = dotfiles/tmux.conf;
    };

    sessionVariables = {
      #EDITOR = "nvim";
    };

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "24.11"; # Please read the comment before changing.
  };

  # Check available nixpkgs   => https://search.nixos.org/packages
  # List of available modules => https://github.com/nix-community/home-manager/tree/master/modules
  imports = [
    ./pkgs/editor.nix
    ./pkgs/git.nix
    ./pkgs/languages.nix
    #./pkgs/shell.nix
    ./pkgs/utils.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
