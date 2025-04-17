```bash
git clone https://github.com/DanteDogDev/dotfiles ~/dotfiles --bare
git --git-dir=$HOME/dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no
git --git-dir=$HOME/dotfiles/ --work-tree=$HOME reset --hard HEAD
```
