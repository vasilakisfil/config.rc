# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"

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
export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color


export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
source ~/.rvm/scripts/rvm


export PATH=$HOME/npm/bin:$PATH
source ~/.nvm/nvm.sh


eval "$(direnv hook zsh)" #direnv
[[ -s "/home/vasilakisfil/.gvm/scripts/gvm" ]] && source "/home/vasilakisfil/.gvm/scripts/gvm"

export ANDROID_HOME=/home/vasilakisfil/Android/Sdk

source ~/.git-flow-completion.zsh

export PATH="$HOME/bin:$PATH" #Add local scripts

#import aliases
source $HOME/.aliases

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

export PATH="$HOME/.crenv/bin:$PATH" #Add crystal, TODO: Remove that and use asdf!
eval "$(crenv init -)"


setopt inc_append_history
setopt hist_ignore_dups
setopt hist_ignore_space

# needed for go packages
export GOPATH=$HOME/go

source ~/.tools/bashmarks.sh

export CURRENT_PROJECT_PATH=$HOME/.current-project

function chpwd {
   #much faster than: guake -r ${PWD##*/}
   #use --print-reply to debug, otherwise remains silent (for envs that don't have guake)
   dbus-send --session --type=method_call --dest=org.guake3.RemoteControl /org/guake3/RemoteControl org.guake3.RemoteControl.rename_current_tab string:"${PWD##*/}" > /dev/null
}

#allow iex to remember history
export ERL_AFLAGS="-kernel shell_history enabled"

#fix android studio lib issues
export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1

[ -s "/home/vasilakisfil/.jabba/jabba.sh" ] && source "/home/vasilakisfil/.jabba/jabba.sh"

export PATH="$HOME/.cargo/env:$PATH"

function git_wrapper() {
  for arg in "$@"; do
    if [ "$arg" = "push" ]; then
      ispush=1
    elif [ "$ispush" = 1 -a "$arg" = '-f' ]; then
      echo "Force pushed disabled. Use this instead: git push --force-with-lease (or git pushf)"
      return
    fi
  done

  git "$@"
}

#alias git=git_wrapper

export BAT_THEME="Solarized (light)"

##### theme stuff (basically russel with some modifications) ######
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

PROMPT='%D{%L:%M:%S} '$PROMPT

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

if [[ -n "$PS1" ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then
  tmux new -s 0
  tmux attach -t 0
fi
