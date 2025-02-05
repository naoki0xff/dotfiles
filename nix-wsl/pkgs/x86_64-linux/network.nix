{ self, inputs, system, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    dig
    openssl
  ];
}
