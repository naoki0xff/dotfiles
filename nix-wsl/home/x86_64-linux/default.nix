{ self, inputs, username, system, localhostname, pkgs, ... }:

# Configuration Options
# => https://nix-community.github.io/home-manager/options.xhtml
{
  # HOME Config
  home = {
    # Dotfiles Management
    file = {
      ".npmrc".source = dotfiles/npm/npmrc;
    #  ".config/git" = {
    #    source = dotfiles/git;
    #    recursive = true;
    #  };
    };

    sessionVariables = {
      GOPATH = "/home/${username}/usr/local/go";
      GOBIN = "/home/${username}/usr/local/go/bin";
    };
    sessionPath = [
      "/home/${username}/usr/local/go/bin"
      "/home/${username}/.npm-packages/bin"
    ];

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "24.11"; # Please read the comment before changing.
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
