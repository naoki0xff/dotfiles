### zprofile

# compatibility
autoload -U compinit
compinit
# prompt
autoload -U promptinit
promptinit
PROMPT='%F{green}naoki@macos:%f%~%F{green}$%f'
# history & completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
export HISTFILE=${HOME}/.zhistory
export HISTSIZE=10000
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
# etc
stty stop undef

# VARIABLE
export BROWSER=/Applications/Vivaldi.app/Contents/MacOS/Vivaldi
export EDITOR=nvim
bindkey -e
export MANPAGER="nvim -c 'set ft=man' -"
export XDG_CONFIG_HOME=~/.config
export VBACKUPDIR=~/.local/share/nvim/backup
export LANG=en_US.UTF-8
# PATH
PATH="$PATH:$HOME/usr/bin:/usr/local/opt/coreutils/libexec/gnubin:$HOME/.config/composer/vendor/bin"
export MANPATH="$MANPATH:/usr/local/opt/coreutils/libexec/gnuman"
# LANGUAGE
# -> python
eval "$(pyenv init -)"
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:$PATH"
# -> ruby
eval "$(rbenv init -)"
# avoid duplication
typeset -U path PATH

# CLI tools
# git
autoload -Uz add-zsh-hook
autoload -Uz colors
colors
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true
autoload -Uz is-at-least
if is-at-least 4.3.10; then
  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' stagedstr "+"    
  zstyle ':vcs_info:git:*' unstagedstr "-"  
  zstyle ':vcs_info:git:*' formats '(%s)-[%b] %c%u'
  zstyle ':vcs_info:git:*' actionformats '(%s)-[%b|%a] %c%u'
fi
function _update_vcs_info_msg() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
add-zsh-hook precmd _update_vcs_info_msg
RPROMPT="%1(v|%F{green}%1v%f|)"
# R
disable r
# tmux
[[ -z $TMUX && ! -z "$PS1" ]] && tmux
set -o ignoreeof # stop tmux from exiting with C-d
## fzf
# env
export FZF_DEFAULT_OPTS='--height 40% --reverse'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_TMUX=1
export FZF_DEFAULT_COMMAND='ag -a'
export FZF_COMPLETION_TRIGGER=',,'
# history search (override)
fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}
zle     -N     fzf-history-widget-accept
bindkey '^R' fzf-history-widget-accept
