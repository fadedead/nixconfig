{ config, lib, pkgs, ... }:

{
  imports =
    [ 
    ./hardware-configuration.nix
    ];
  
  # Boot
  boot = {
  loader.systemd-boot.enable = true;
  loader.efi.canTouchEfiVariables = true;
  # kernelParams = [ "i915.force_probe=46a6" ]; 
  };

  # Timezone
  time.timeZone = "Asia/Kolkata";

  # Networking
  networking = { 
    hostName = "hyprcat"; 
    networkmanager.enable = true;  
    nameservers = ["1.1.1.1" "8.8.4.4" "8.8.8.8" "9.9.9.9"];
  };

  # environment.etc = {
  #   "resolv.conf".text = "nameserver 1.1.1.1\nnameserver 8.8.8.8";
  # };
 
  # Xorg keyboard
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.options = "caps:escape";

  # Mysql
  services.mysql.package = pkgs.mariadb;
  services.mysql.enable = true;

  # Gnome key-ring
  services.gnome.gnome-keyring.enable = true;

  # Xorg Touchpad 
  services.xserver.libinput.enable = true;

  # Sound
  security.rtkit.enable = true;   
  services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
  };
  sound.enable = true;

  # Video 
  hardware.opengl.enable = true;
  hardware.nvidia.modesetting.enable = true;

  # Brightness control
  hardware.brillo.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # System packages
  environment.systemPackages = with pkgs; [ vim wget git ];

  # Allow unfree software
  nixpkgs.config.allowUnfree = true;

  # User
  users.users.fadedead = {
    initialPassword = "pw123";
    isNormalUser = true;
    extraGroups = ["power" "storage" "wheel" "audio" "video" "networkmanager"]; 
    shell = pkgs.zsh;
  };
  
  # Auto login user
  services.getty.autologinUser = "fadedead";

  # sudo Password for wheel group
  security.sudo.wheelNeedsPassword = false;

  # Enable zsh
  programs.zsh.enable = true;

  # Hyprland portals
  xdg.portal = {
    enable = true;
    config.common.default = "*";
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk ];
  };
  
  # dconf for gtk
  programs.dconf.enable = true;

  # OpenSSH
  services.openssh.enable = true;

  # Battery optimisation using auto-cpufreq
  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";
      turbo = "never";
    };
    charger = {
      governor = "performance";
      turbo = "auto";
    };
  };

  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes"];

  system.stateVersion = "23.11";     }

