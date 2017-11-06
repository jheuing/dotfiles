# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jh"


# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rvm ruby rails osx heroku github git battery per-directory-history)

# tmux:
#ZSH_TMUX_AUTOSTART=true

export EDITOR="vim"

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin

# rbenv:
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
#export PATH="$PATH:$HOME/.rvm/bin"

# Aliase dev
alias dev="~/Desktop/Development"

# Aliase ruby 
alias rs="rails s"
alias rc="rails c"


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#alias tmux="TERM=screen-256color-bce tmux"
export TERM="xterm-256color"


#alias tmux="TERM=screen-256color-bce tmux"
#source ~/.tmuxinator/tmuxinator.zsh

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# added by travis gem
[ -f /Users/jh/.travis/travis.sh ] && source /Users/jh/.travis/travis.sh

JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home/"


# Node setup
export NODE_ENV=development

#export NVM_DIR=~/.nvm
#source $(brew --prefix nvm)/nvm.sh

#alias ng="ngrok -subdomain=jh -authtoken w4qm/0OO+30RSrlHqG7a 3000"

alias vi="/usr/bin/vim"

