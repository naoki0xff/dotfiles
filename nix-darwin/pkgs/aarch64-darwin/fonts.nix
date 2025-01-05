{ self, inputs, system, pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      # Nerd Fonts
      # => https://www.nerdfonts.com/font-downloads
      nerd-fonts.hack
    ];
  };
}
