{ config, pkgs, ... }:

{
  imports = [
    ./zsh.nix
  ];
# Home Manager needs a bit of information about you and the paths it should
# manage.
  home.username = "fadedead";
  home.homeDirectory = "/home/fadedead";
  home.stateVersion = "23.11"; # Please read the comment before changing.

# The home.packages option allows you to install Nix packages into your
# environment.
    home.packages = with pkgs; [
    xwayland

      hyprland
      waybar
      wofi
      swaybg
      wl-clipboard
      wezterm

      slurp
      grim

      neovim

      brave

      keepass

      fzf
      unzip
      btop
      jq
      bluetuith
      stow
      ripgrep

      zig
      nodejs_21
      python3

      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      fira-code
      fira-code-symbols
      fira-code-nerdfont
      nerdfonts
      ];

# Home Manager is pretty good at managing dotfiles. The primary way to manage
# plain files is through 'home.file'.
  home.file = {
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };

    iconTheme = {
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Sans";
      size = 11;
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    NIXOS_OZONE_WL = "1"; 
  };

  home.pointerCursor = {
    gtk.enable = true;
# x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 12;
  };


# Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
