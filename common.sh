export EDITOR=nvim
export APACHE="/Library/WebServer/Documents"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_40.jdk/Contents/Home"

add_path() {
  if [[ -n $IN_NIX_SHELL ]]; then
    return
  fi

  #don't add duplicates
  if [[ ":$PATH:" == *":$1:"* ]]; then
    return
  fi

  PATH="$1:${PATH:+"$PATH"}"
}

source_secrets() {
  if [[ -f ~/.config/shell/secrets.sh ]]; then
    source ~/.config/shell/secrets.sh
  fi
}

#add_path "/usr/local/git/bin:/usr/local/bin:/Users/shantanu/Development/adt-bundle-mac-x86_64-20130917/sdk/platform-tools:/Users/shantanu/bin:/Users/shantanu/.cabal/bin:/usr/local/heroku/bin:/opt/local/bin:/opt/local/sbin:/usr/local/go/bin:/Users/shantanu/Blog/pygments:/usr/bin:/bin:/usr/sbin:/sbin:/opt/local/bin:/usr/local/mysql/bin"
add_path "/usr/local/git/bin:/usr/local/bin:/Users/shantanu/Development/adt-bundle-mac-x86_64-20130917/sdk/platform-tools:/Users/shantanu/.cabal/bin:/usr/local/heroku/bin:/opt/local/bin:/opt/local/sbin:/usr/local/go/bin:/Users/shantanu/Blog/pygments:/usr/bin:/bin:/usr/sbin:/sbin:/opt/local/bin:/usr/local/mysql/bin"
export GOPATH="$HOME/go"
export GOBIN="$HOME/go/bin"
add_path "$GOBIN"
#export MANPATH="/usr/local/man:$MANPATH"
#
# k8s modifications
add_path "${KREW_ROOT:-$HOME/.krew}/bin"

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

alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

#fzf options
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Nix
#
# https://ianthehenry.com/posts/how-to-learn-nix/nix-zshell/
#export NIX_BUILD_SHELL='/Users/shantanu/src/github.com/joshi4/nix-zsh/result'

# so ls works in nix and direnv shells
alias ls='ls --color=auto'

if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ] && [[ -z $IN_NIX_SHELL ]]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

source_secrets
#This should always be the last line
export PATH
