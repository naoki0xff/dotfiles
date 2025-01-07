{ self, inputs, system, pkgs, ... }:

{
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };
}
