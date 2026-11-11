{ self, inputs, system, pkgs, ... }:

{
  # Codex CLI/Descktop
  programs.codex = {
    enable = true;
    package = null;
    mutableSettings = true; # NOTE: This options enable options merging into "~/.codex/config.toml" but not erasing other configurations.
    settings.approval_policy = "never";
  };
}
