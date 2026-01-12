ZSH=$HOME/.oh-my-zsh
DISABLE_AUTO_UPDATE="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh

setopt nocorrectall; setopt correct

#256 colors
export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color

eval "$(direnv hook zsh)" #direnv

export PATH="$HOME/bin:$PATH" #Add local scripts

#import aliases
source $HOME/.aliases

setopt inc_append_history
setopt hist_ignore_dups
setopt hist_ignore_space

echo -ne "\033]0;$PWD\007"
function chpwd {
  if [[ $(uname) == "Darwin" ]]; then
    echo -ne "\033]0;$PWD\007"
  else
    #much faster than: guake -r ${PWD##*/}
    #use --print-reply to debug, otherwise remains silent (for envs that don't have guake)
    dbus-send --session --type=method_call --dest=org.guake3.RemoteControl /org/guake3/RemoteControl org.guake3.RemoteControl.rename_current_tab string:"${PWD##*/}" > /dev/null
  fi
}

#allow iex to remember history
export ERL_AFLAGS="-kernel shell_history enabled"

export PATH="$HOME/.cargo/env:$PATH"

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

#export PATH=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib:$PATH
#export LIBRARY_PATH="$LIBRARY_PATH:/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib" # Needed for Rust compilation and linking
#export SDKROOT=$(xcrun --sdk macosx --show-sdk-path)
#export LIBRARY_PATH="$LIBRARY_PATH:$SDKROOT/usr/lib"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
