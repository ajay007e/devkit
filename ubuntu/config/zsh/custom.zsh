
export PATH=$HOME/.local/bin:$PATH

# oh-my-zsh
export ZSH="$HOME/.config/oh-my-zsh"
export ZSH_CUSTOM="$HOME/.config/oh-my-zsh/custom"

# prompt
fpath+=$HOME/.config/zsh/typewritten
autoload -U promptinit; promptinit
prompt typewritten

export TYPEWRITTEN_PROMPT_LAYOUT="half_pure"
export TYPEWRITTEN_SYMBOL="➜"
export TYPEWRITTEN_ARROW_SYMBOL="➜"
export TYPEWRITTEN_RELATIVE_PATH="adaptive"
export TYPEWRITTEN_CURSOR="beam"

# theme
ZSH_THEME=""

# plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

#bindkey '^_' autosuggest-accept

source $ZSH/oh-my-zsh.sh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tmux
if which tmux 2>&1 >/dev/null; then
  if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
    tmux attach -t default || tmux new -s default; exit
  fi
fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(zoxide init zsh)"
