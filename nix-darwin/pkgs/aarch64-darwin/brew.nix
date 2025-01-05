{ self, inputs, system, pkgs, ... }:

{
  homebrew = {
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
      "podman-desktop"
      #"vivaldi"
    ];
  };
}
