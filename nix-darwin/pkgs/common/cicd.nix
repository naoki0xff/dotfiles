{ self, inputs, system, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Vulnerability Detection
    datree
    trivy

    # Misc
    reviewdog
  ];
}
