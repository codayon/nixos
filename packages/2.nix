{ pkgs, ... }:
{
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
}
