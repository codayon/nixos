{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pkgs.gh
    pkgs.git
    pkgs.vim
    pkgs.btop
    pkgs.wget
    pkgs.unzip
    pkgs.kitty
    pkgs.ranger
    pkgs.neovim
    pkgs.haruna
    pkgs.yt-dlp
    pkgs.neofetch
    pkgs.chromium
    pkgs.vscodium
    pkgs.keepassxc
    pkgs.fastfetch
    pkgs.obs-studio
    pkgs.ffmpeg-full
    pkgs.nixpkgs-fmt
    pkgs.qbittorrent
    pkgs.protonvpn-gui
    pkgs.nixfmt-rfc-style
  ];
}
