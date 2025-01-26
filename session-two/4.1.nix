{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  time.timeZone = "Asia/Dhaka";

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
    inputMethod = {
      type = "fcitx5";
      enable = true;
      fcitx5.waylandFrontend = true;
      fcitx5.addons = with pkgs; [
        fcitx5-openbangla-keyboard
      ];
    };
  };

  services = {
    printing.enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };

  environment = {
    plasma6 = {
      excludePackages = with pkgs.kdePackages; [ konsole ];
    };
  };

  hardware = {
    pulseaudio = { enable = false; };
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        vpl-gpu-rt
      ];
    };
  };

  security = {
    rtkit = {
      enable = true;
    };
    wrappers = {
      btop = {
        owner = "root";
        group = "root";
        source = lib.getExe pkgs.btop;
        capabilities = "cap_perfmon=+ep";
      };
    };
  };

  users = {
    users.codayon = {
      isNormalUser = true;
      description = "Reshad Ahammed Ayon";
      extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
      packages = with pkgs; [
        kdePackages.kate
      ];
    };
  };

  programs = {
    firefox.enable = true;
    kdeconnect.enable = true;
    virt-manager.enable = true;
  };

  environment.systemPackages = with pkgs; [
    gh
    git
    vim
    btop
    wget
    unzip
    kitty
    ranger
    neovim
    haruna
    yt-dlp
    neofetch
    chromium
    vscodium
    keepassxc
    fastfetch
    obs-studio
    ffmpeg-full
    nixpkgs-fmt
    qbittorrent
    protonvpn-gui
    nixfmt-rfc-style
  ];

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  system.stateVersion = "24.11";

}
