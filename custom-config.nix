{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # hostname
  networking.hostName = "dhaka";

  # networking
  networking.networkmanager.enable = true;

  # time zone
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

  # hardware graphics extra packages
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      vpl-gpu-rt
      libvdpau-va-gl
      intel-media-driver
      intel-compute-runtime
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [ intel-vaapi-driver ];
  };

  # environment variables
  environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; };
  # NIXOS_OZONE_WL = "1"; 

  # display manager
  services.displayManager = {
    defaultSession = "plasma";
    sddm = {
      enable = true;
      wayland.enable = true;
    };
  };

  # desktop environment
  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
  ];

  # window manager
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  # sound with pipewire
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    alsa.support32Bit = true;
    wireplumber.enable = true;
  };

  # user account
  users.users.me = {
    isNormalUser = true;
    description = "home";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # default shell configuration
  users.defaultUserShell = pkgs.zsh;
  programs = {
    zsh = {
      enable = true;
      autosuggestions.enable = true;
      zsh-autoenv.enable = true;
      syntaxHighlighting.enable = true;
      ohMyZsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [
          "git"
          "history"
        ];
      };
    };
  };

  # users group
  users.groups.libvirtd.members = [ "me" ];

  # unfree packages
  nixpkgs.config.allowUnfree = true;

  # install programs via options
  programs.kdeconnect.enable = true;
  programs.virt-manager.enable = true;

  # fonts
  fonts.packages = with pkgs; [
    roboto
    lexend
    unifont
    nerdfonts
    fira-code
    hack-font
    noto-fonts
    font-awesome
    dejavu_fonts
    liberation_ttf
    jetbrains-mono
    lohit-fonts.bengali
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
  ];

  # open banla keyboard on wayland with fcitx 5
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      fcitx5-openbangla-keyboard
    ];
  };

  # environment system packages
  environment.systemPackages = with pkgs; [
    vim
    git
    wofi
    qemu
    wget
    kitty
    haruna
    waybar
    yt-dlp
    firefox
    hypridle
    hyprshot
    hyprlock
    waypaper
    vscodium
    nwg-look
    hyprpaper
    keepassxc
    obs-studio
    teamviewer
    nixpkgs-fmt
    qbittorrent
    ffmpeg-full
    protonvpn-gui
    github-desktop
    hyprpolkitagent
    kdePackages.kdenlive
  ];

  # nix flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # list services that you want to enable:

  # virtualization
  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  # flatpak and xdg portal
  services.flatpak.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "gtk";

  # system state version
  system.stateVersion = "24.11";

}
