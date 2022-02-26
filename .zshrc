
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
#
zinit load robobenklein/zdharma-history-search-multi-word
zinit load zsh-users/zsh-completions
zinit load zsh-users/zsh-syntax-highlighting

# for starship
eval "$(starship init zsh)"

# command correct edition before each completion attempt
setopt correct

# no remove postfix slash of command line
setopt noautoremoveslash

# no beep sound
setopt nobeep
setopt nolistbeep

## Command history configuration
HISTFILE=${HOME}/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups     # ignore duplication command history list
setopt hist_ignore_space    # ignore head space begin command
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt inc_append_history
setopt share_history        # share command history data

## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases     # aliased ls needs if file/dir completions work

alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'

alias j="jobs -l"
alias h="history 1"

alias ls="ls -GF"
alias ll="ls -al"

alias less="less -R"

alias du="du -h"
alias df="df -h"

alias su="su -l"

alias vim="nvim"

# Changing Directories
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

autoload -Uz compinit
compinit
