{ self, inputs, system, pkgs, ... }:

{
  # Codex CLI/Descktop
  programs.codex = {
    enable = true;
    package = null;
    mutableSettings = true; # NOTE: This options enable options merging into "~/.codex/config.toml" but not erasing other configurations.
    settings.approval_policy = "on-request";

    # Integrate Apple native Apps
    # NOTE: You have to change Codex permission manually. Go "Chat" panel and open permission setting next to "+" button. Change value to "Approve for me" and you'll be able to access them.
    settings.computer_use = {
      default_app_access = "allow";
    };
  };
}
