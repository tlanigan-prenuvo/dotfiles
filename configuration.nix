{ user, ... }:

{
  # Determinate already manages the Nix daemon, so nix-darwin shouldn't.
  nix.enable = false;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin"; # use x86_64-darwin for Intel CPU

  system.primaryUser = user;
  users.users.${user} = {
    home = "/Users/${user}";
  };
  system.stateVersion = 6;
  system.defaults = {
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      KeyRepeat = 2;          # fast key repeat
      InitialKeyRepeat = 15;  # short delay before repeat
      _HIHideMenuBar = false; # keep the menu bar always visible
      AppleShowAllExtensions = true;
    };
    dock.autohide = true;
    finder.FXPreferredViewStyle = "Nlsv";  # list view by default
    finder.CreateDesktop = true;           # keep icons on the Desktop
    trackpad.Clicking = false;             # tap-to-click off; press to click
  };
  nix-homebrew = {
    enable = true;
    inherit user;
    # This Mac already had Homebrew at /opt/homebrew before nix-darwin.
    # Adopt it (keeping installed packages) instead of failing on first switch.
    autoMigrate = true;
  };
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";  # remove anything not listed here
    onActivation.autoUpdate = true;
    onActivation.extraFlags = [ "--force" ];
    # Everything below was installed on this machine before nix-darwin.
    # With cleanup = "zap", anything NOT listed here is uninstalled on switch,
    # so keep this in sync with what you actually want on the machine.
    taps = [
      "databricks/tap"
      "dbt-labs/dbt-cli"
      "hashicorp/tap"
      "spacelift-io/spacelift"
    ];
    brews = [
      "argc"
      "awscli"
      "dcmtk"
      "direnv"
      "gh"
      "hashicorp/tap/terraform"
      "herdr"
      "just"
      "nano"
      "node"
      "pipx"
      "pyenv"
      "sops"
      "terragrunt"
      "tmux"
      "uv"
      "wget"
      "yarn"
    ];
    casks = [
      "wezterm"
      "claude-code"
      "font-meslo-lg-nerd-font"
      "spacelift-io/spacelift/spacectl"
    ];
  };
}
