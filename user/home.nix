{ config, pkgs, lib, ... }:

{
  imports = [
    ./zsh.nix
  ];

  # Home
  home.username = "fadedead";
  home.homeDirectory = "/home/fadedead";

  # ENV variables
  home.sessionVariables = {
    EDITOR = "nvim";
    NIXOS_OZONE_WL = "1"; 
  };

  home.packages = with pkgs; [
    hyprland
    waybar
    wofi
    swaybg
    wl-clipboard
    wezterm
    swaynotificationcenter

    xwayland
    slurp
    grim

    brave
    firefox
    discord
    spotify

    neovim

    keepass
    cinnamon.nemo

    wireguard-tools
    openresolv

    fzf
    fd
    zip
    unzip
    btop
    jq
    bluetuith
    stow
    ripgrep
    brillo
    tree
    bfg-repo-cleaner

    zig
    nodejs_21
    python3
    virtualenv
    cargo
    typescript
    jdk8
    maven

    jetbrains.idea-community
    mysql-workbench
    dbeaver   
    percona-server_8_0
    bruno

    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    fira-code
    fira-code-symbols
    fira-code-nerdfont
    nerdfonts
  ];

  # theme gtk
  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-gtk";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "compact";
        tweaks = [ "rimless" "black" ];
        variant = "mocha";
      };
    };
  };

  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };

# theme mouse pointer
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 12;
  };

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
