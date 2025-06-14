{ self, inputs, username, system, pkgs, ... }:

{
  system.primaryUser = "${username}";
  homebrew = {
    # 'enable' option doesn't install homebrew binary
    enable = true;
    onActivation = {
      autoUpdate = true;
    };

    # Execute `brew search ${pkg}` and check which type your application belongs
    # brew install for 'Formulae'
    brews = [
      "podman"
      "podman-compose"
    ];
    # brew install --cask for 'Casks'
    casks = [
      "obsidian"
      "podman-desktop"
      "slack"
      "vivaldi"
    ];
  };
}
