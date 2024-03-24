{ config, pkgs, ... }:

{
  imports = [
    ./zsh.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "fadedead";
  home.homeDirectory = "/home/fadedead";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
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
    
    xdg-desktop-portal
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
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

    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    fira-code
    fira-code-symbols
    fira-code-nerdfont
    nerdfonts

    zig
    nodejs_21
    python3
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };


  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/fadedead/etc/profile.d/hm-session-vars.sh
  #

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

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
