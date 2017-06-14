#zsh template?
autoload -U compinit
compinit

#prompt
autoload -U promptinit
promptinit
PROMPT='%m:%F{magenta}%~%f%#'

#history and completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
export HISTFILE=${HOME}/.zhistory
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_verify
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_no_store
setopt hist_expand
setopt inc_append_history
bindkey "^R" history-incremental-search-backward
#to avoid terminal from interpreting ctrl+s, instead shell can interpret that
stty stop undef
bindkey "^S" history-incremental-search-forward

#migrating .bash_profile
source ~/.bash_profile

#extra settings
#to diactivate zsh built-in-command r, and to activate 'r' commaand to start rstuio
disable r
