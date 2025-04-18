PACMAN=(
  git
  lazygit
  neovim
  fastfetch
  yazi
  7zip
  git-delta
)
for PKG in "${PACMAN[@]}"; do
    echo "--------------------"
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
    echo "--------------------"
done
