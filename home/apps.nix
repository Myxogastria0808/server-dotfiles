{ pkgs, ... }: {
  imports = [
    # ./config/alacritty.nix
    ./config/git.nix
    ./config/firefox.nix
    ./config/nvim/nvim.nix
    ./config/commands.nix
    ./config/docker.nix
  ];
  # Install pkgs
  home.packages = with pkgs; [
    # TeXLive full install
    texlive.combined.scheme-full
    # Typst
    typst
    # Font
    _0xproto
    nerdfonts
  ];
}
