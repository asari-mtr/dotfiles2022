#!/usr/bin/env bash
DOT_FILES=(.zshrc .tmux.conf .tigrc .gitconfig)

# Install brew
if !(type brew > /dev/null 2>&1); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
touch ~/.gitconfig.env

# if !(type brew > /dev/null 2>&1); then
#   DOT_FILES=(.Brewfile .Brewfile-cask "${DOT_FILES[@]}")
# fi

for file in ${DOT_FILES[@]}
do
  if [[ -e $HOME/$file ]]; then
    echo "File exists $file"
  else
    ln -s $HOME/dotfiles/$file $HOME/$file
    echo "File created $file"
  fi
done

CONF_PATH=~/.config
mkdir -p $CONF_PATH

# for starship
ln -s $PWD/starship.toml $CONF_PATH/starship.toml

# for nvim
NVIM_CONF=~/.config/nvim
ln -s $PWD/init.vim $NVIM_CONF/init.vim

brew bundle install --file .Brewfile --verbose --no-upgrade --no-lock

# Install tpm
TMUX_PLUIGINS=~/.tmux/plugins
mkdir -p $TMUX_PLUGINS
if [ ! -d $TMUX_PLUGINS/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo ""
echo "#####################################################################"
echo "If you need to, please install it manually with the following command."
echo ""
echo "$ brew bundle install --file .Brewfile-cask --verbose --no-upgrade --no-lock"
echo "#####################################################################"
echo ""

