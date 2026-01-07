# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
ZSH_DISABLE_COMPFIX=true
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="philips"
#ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
#
#
#
#
#source  /Users/shantanu/go/src/github.com/zsh-syntax-highlighting/zsh-syntax-highlighting.sh

# source common vars, paths and alias between zsh and bash

plugins=(evalcache git brew golang web-search gitfast zsh-syntax-highlighting vi-mode)
bindkey -M viins 'fd' vi-cmd-mode

source $ZSH/oh-my-zsh.sh
export HIST_TIME_FORMAT=
# setopt noextendedhistory
source ~/.config/shell/common.sh


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

source $ZSH/custom/aliases.sh
source $ZSH/custom/customization.sh

#autocorrect options 
unsetopt correct_all  # don't correct args for cmd, no more errors on git log.
unsetopt correct # correct commands.


# Appends every command to the history file once it is executed
setopt INC_APPEND_HISTORY
export HISTFILE=~/.zsh_history
setopt HIST_FCNTL_LOCK
# Reloads the history whenever you use it
setopt share_history

# bun completions
[ -s "/Users/shantanu/.bun/_bun" ] && source "/Users/shantanu/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
add_path "$BUN_INSTALL/bin"

#export PATH="$HOME/bin:$PATH"
# add_path "$HOME/bin"
add_path "$HOME/src/github.com/getsavvyinc/savvy-cli"
add_path "$HOME/.claude/local"


#https://github.com/Homebrew/homebrew-core/issues/181152
# in nix shell, the PATH and TMPDIR is v long.
export TMPDIR=/tmp
export WATCHMAN_STATE_DIR=/tmp

alias bash='/opt/homebrew/bin/bash'

_evalcache zoxide init zsh
_evalcache starship init zsh
_evalcache atuin init zsh --disable-up-arrow
## TEST if this works with kubie shells
# source ~/src/github.com/savvy-prototype/savvy.sh

# silence verbose direnv logs 
#export DIRENV_LOG_FORMAT=
_evalcache direnv hook zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

add_path "/Users/shantanu/.savvy/bin:$PATH"
eval "$(savvy init zsh)"


#function __savvy_prompt_pre_cmd__() {
#  /Users/shantanu/src/github.com/getsavvyinc/savvy-cli/savvy-dev internal set-param --title="ls <dir> <depth>"
#}
#add-zsh-hook precmd __savvy_prompt_pre_cmd__
export PATH="${HOME}/.local/bin:$PATH"
alias claude="/Users/shantanu/.claude/local/claude"
