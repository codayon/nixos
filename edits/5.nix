{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # bootloader
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  # networking
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  # timezone
  time.timeZone = "Asia/Dhaka";

  # locale
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # services
  services = {
    printing.enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };

  # pulseaudio and rtkit
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  # user account
  users.users.codayon = {
    isNormalUser = true;
    description = "Reshad Ahammed Ayon";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  # programs with options
  programs.firefox.enable = true;

  # packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    gh
    git
    vim
    wget
    haruna
    neovim
    vscode
    yt-dlp
    chromium
    keepassxc
    obs-studio
    nixpkgs-fmt
    protonvpn-gui
    nixfmt-rfc-style
  ];

  # system state version
  system.stateVersion = "24.11";

}
