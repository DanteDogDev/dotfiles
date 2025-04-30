PACMAN=(
  # Internet
  networkmanager
  # hyprland
  hyprland
  xdg-desktop-portal-hyprland
  hyprpaper
  hyprpicker
  # nvidia
  nvidia
  nvidia-prime
  # fonts
  noto-fonts
  noto-fonts-extra
  noto-fonts-cjk
  noto-fonts-emoji
  # clipboard
  wl-clipboard
  cliphist
  # brightness
  brightnessctl
  # launcher
  fuzzel
  # tools
  git
  7zip
  grim
  slurp
  # Neovim Stuff
  neovim
  lua
  lua51
  luarocks
  curl
  npm
  rust
  tree-sitter-cli
  # Finder
  ripgrep
  fd
  fzf
  ripgrep
  # tui
  fastfetch
  lazygit
  yazi
  git-delta
  # application
  kitty
  firefox
)

YAY=(
  # asus
  asusctl
  supergfxctl
  vesktop
)

echo "--------------------------------"
echo "-- INSTALLING PACMAN PACKAGES --"
echo "--------------------------------"
for PKG in "${PACMAN[@]}"; do
    echo "--------------------"
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
    echo "--------------------"
done

echo "--------------------------------"
echo "--   INSTALLING YAY PACKAGES  --"
echo "--------------------------------"
for PKG in "${YAY[@]}"; do
    echo "--------------------"
    echo "INSTALLING: ${PKG}"
    yay -S "$PKG" --noconfirm --needed
    echo "--------------------"
done
