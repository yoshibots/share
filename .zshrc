# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

export SHELL=/usr/bin/zsh

# 環境変数EDITORにvimを設定
export EDITOR=vim

# COMMAND HISTORY ++++++++++++++++++++++++++++++++++++++++++++++++

setopt SHARE_HISTORY # 履歴を共有する
setopt HIST_IGNORE_ALL_DUPS # 履歴中の重複行をファイルに記録しない
setopt HIST_IGNORE_DUPS  # 前と重複する行は記録しない
setopt HIST_IGNORE_SPACE # 行頭がスペースのコマンドは記録しない

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ END

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# locale
export LC_ALL=en_US.UTF-8 # Priority:top
export LANG=en_US.UTF-8

# Use modern completion systeCm
autoload -Uz compinit
compinit

# XDG BASE DIRECTORY
export XDG_CONFIG_HOME=~/.config

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# zplug ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#
source ~/.zplug/init.zsh

# 非同期処理できるようになる
zplug "mafredri/zsh-async"

# 構文のハイライト
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# 補完強化
zplug "zsh-users/zsh-completions"

# 256色表示にする
zplug "chrissicool/zsh-256color"

# Theme
# zplug "sindresorhus/pure"

# インストールされていなければインストールする
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ END

# Alias ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
alias ls='ls --color=auto'
alias vi=vim

alias update='/home/yoshi/Code/sh/flush.sh'
alias tscreen='/home/yoshi/Code/sh/tscreen.sh'
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ END

# Direnv ++++++++++++++++++
eval "$(direnv hook zsh)"
# +++++++++++++++++++++ END
