{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # boot
  boot = {
    initrd.kernelModules = ["i915"];
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

  # i18n
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
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

  # hardware
  hardware = {
    pulseaudio.enable = false;
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        vpl-gpu-rt
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        intel-vaapi-driver
      ];
    };
  };

  # security
  security.rtkit.enable = true;

  # users
  users.users.codayon = {
    isNormalUser = true;
    description = "Reshad Ahammed Ayon";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  # programs
  programs = {
    firefox.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };

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
    mangohud
    chromium
    keepassxc
    obs-studio
    nixpkgs-fmt
    protonvpn-gui
    nixfmt-rfc-style
  ];

  # system
  system.stateVersion = "24.11";

}
