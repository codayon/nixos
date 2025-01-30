{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      gh
      git
      vim
      btop
      nixd
      wget
      brave
      unzip
      kitty
      ranger
      neovim
      haruna
      yt-dlp
      neofetch
      chromium
      vscodium
      alejandra
      keepassxc
      librewolf
      fastfetch
      obs-studio
      ffmpeg-full
      nixpkgs-fmt
      qbittorrent
      protonvpn-gui
      nixfmt-rfc-style
    ];
  };
}
