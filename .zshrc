# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

setopt nocorrectall; setopt correct

#256 colors
export TERM='xterm-256color'


export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
source ~/.rvm/scripts/rvm


export PATH=$HOME/npm/bin:$PATH
source ~/.nvm/nvm.sh


eval "$(direnv hook zsh)" #direnv
[[ -s "/home/vasilakisfil/.gvm/scripts/gvm" ]] && source "/home/vasilakisfil/.gvm/scripts/gvm"

export ANDROID_HOME=/home/vasilakisfil/Android/Sdk

export PSQL_EDITOR="/usr/bin/vim.gtk"

source ~/.git-flow-completion.zsh

PROMPT='${ret_status}%*%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}%{$reset_color%}'

export PATH="$HOME/bin:$PATH" #Add local scripts

#import aliases
source $HOME/.aliases

# Add elixir
test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"

export PATH="$HOME/.kerl/bin:$PATH" #Add kerl (erlang version manager)

export PATH="$HOME/.crenv/bin:$PATH" #Add crystal
eval "$(crenv init -)"
