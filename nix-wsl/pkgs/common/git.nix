{ self, inputs, system, pkgs, ... }:

{
  programs.git.enable = true;
  environment.systemPackages = with pkgs; [
    gh
  ];
}
