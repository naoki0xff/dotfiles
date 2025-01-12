{ self, inputs, username, system, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    reattach-to-user-namespace
  ];
}
