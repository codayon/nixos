{pkgs, ...}: {
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
      mangohud
      chromium
      vscodium
      alejandra
      fastfetch
      keepassxc
      librewolf
      fastfetch
      zed-editor
      obs-studio
      ffmpeg-full
      nixpkgs-fmt
      qbittorrent
      protonvpn-gui
      nixfmt-rfc-style
    ];
  };
}
