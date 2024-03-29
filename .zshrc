# Path to your oh-my-zsh installation.
ZSH_DISABLE_COMPFIX=true
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="philips"

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
# DISABLE_UNTRACKED_FILES_DIRTY="true"

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

plugins=(git brew golang web-search gitfast zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

add_path() {
  if [[ -n $IN_NIX_SHELL ]]; then
    echo "IN NIX SHELL"
    return
  fi
  
  #don't add duplicates
  if [[ ":$PATH:" == *":$1:"* ]]; then
    return
  fi

  PATH="$1:${PATH:+"$PATH"}"
}

add_path "/usr/local/git/bin:/usr/local/bin:/Users/shantanu/Development/adt-bundle-mac-x86_64-20130917/sdk/platform-tools:/Users/shantanu/bin:/Users/shantanu/.cabal/bin:/usr/local/heroku/bin:/opt/local/bin:/opt/local/sbin:/usr/local/go/bin:/Users/shantanu/Blog/pygments:/usr/bin:/bin:/usr/sbin:/sbin:/opt/local/bin:/usr/local/mysql/bin"
export GOPATH="$HOME/go"
export GOBIN="$HOME/go/bin"
add_path "$GOBIN"
#export MANPATH="/usr/local/man:$MANPATH"


#setting the editor variable.
export EDITOR=nvim
export APACHE="/Library/WebServer/Documents"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_40.jdk/Contents/Home"


# k8s modifications 
add_path "${KREW_ROOT:-$HOME/.krew}/bin"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias 'grb=git checkout master && git fetch origin master && git rebase origin/master'
alias 'gce=git commit --allow-empty -m \"empty-commit\"'
alias 'gl=git log'
alias 'gbc=git rev-parse --abbrev-ref HEAD' # git branch current
alias 'gpfc=git push origin -u --force-with-lease `gbc`'
alias 'gcof=git checkout $(git branch -a --sort=-committerdate | fzf )'

alias 'n=nvim'
alias 'nf=nvim $(fzf)'
alias 'hf=history | fzf'
alias 'sl=ls'
alias 'ggr=go generate ./...'
alias 'src=source ~/.zshrc'
alias 'gosrc=/Users/shantanu/gosrc/goroot/bin/go'

## Homebrew setup 
add_path "/opt/homebrew/bin:/opt/homebrew/sbin"
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/shantanu/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/shantanu/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/shantanu/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/shantanu/google-cloud-sdk/completion.zsh.inc'; fi
# note this should always be before nvm. 
add_path "/opt/homebrew/bin/node:/usr/local/opt/node/bin"

source $ZSH/custom/render_aliases.sh
source $ZSH/custom/render_customization.sh

#autocorrect options 
unsetopt correct_all  # don't correct args for cmd, no more errors on git log.
unsetopt correct # correct commands.

#fzf options 
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#nvm 
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#
## place this after nvm initialization!
#autoload -U add-zsh-hook
#load-nvmrc() {
#  local node_version="$(nvm version)"
#  local nvmrc_path="$(nvm_find_nvmrc)"
#
#  if [ -n "$nvmrc_path" ]; then
#    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
#
#    if [ "$nvmrc_node_version" = "N/A" ]; then
#      nvm install
#    elif [ "$nvmrc_node_version" != "$node_version" ]; then
#      nvm use
#    fi
#  elif [ "$node_version" != "$(nvm version default)" ]; then
#    echo "Reverting to nvm default version"
#    nvm use default
#  fi
#}
#add-zsh-hook chpwd load-nvmrc
#load-nvmrc

## PYTHON VIRTUALENV
export VENV_PATH="$HOME/.virtualenvs"
export WORKON_HOME=$VENV_PATH
# add poetry to PATH 
add_path "${VENV_PATH}/bin}"

alias start_venv='source $(poetry env info --path)/bin/activate'
## RUST 
add_path "/Users/shantanu/go/src/github.com/racer/target/release:$HOME/.cargo/bin"

#java 
add_path "/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home/bin"


export COLORTERM="truecolor"

# Appends every command to the history file once it is executed
setopt inc_append_history
# Reloads the history whenever you use it
setopt share_history

alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

# Nix
#
# https://ianthehenry.com/posts/how-to-learn-nix/nix-zshell/
export NIX_BUILD_SHELL='/Users/shantanu/src/github.com/joshi4/nix-zsh/result'

# so ls works in nix and direnv shells 
alias ls='ls --color=auto'

if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ] && [[ -z $IN_NIX_SHELL ]]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

export PATH
#prompt_nix_shell_setup
# End Nix
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(atuin init zsh --disable-up-arrow)"
# silence verbose direnv logs 
# export DIRENV_LOG_FORMAT=
export DIRENV_LOG_FORMAT=$'\E[1mdirenv: %s\E[0m'
eval "$(direnv hook zsh)"
