PACMAN=(
  # hyprland
  hyprland
  xdg-desktop-portal-hyprland
  hyprpaper
  hyprpicker
  gtk-engine-murrine
  sassc
  # nvidia
  nvidia
  nvidia-prime
  # tools
  git
  7zip
  grim
  slurp
  # Finder
  ripgrep
  fd
  fzf
  ripgrep
  # tui
  neovim
  fastfetch
  lazygit
  yazi
  git-delta
  # application
  fuzzel
  kitty
  firefox
)

YAY=(
  # asus
  asusctl
  supergfxctl
  rog-control-center
  # application
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
