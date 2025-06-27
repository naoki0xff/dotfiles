### zhsrc

## alias
# sudo w/ alias
alias sudo='sudo '
# shell command
alias ls='ls -CF'
alias sl='ls -CF'
alias ll='ls -1'
alias lt='ls -1t'
alias la='ls -CFalh'
alias lls='tree -N -L 2'
alias lla='tree -a -h -N -L 2'
alias mv='mv -i'
alias cp='cp -i'
alias mkdir='mkdir -p'
alias grep='grep --color=auto'
alias sed='gsed'
alias diff='colordiff -u --nobanner'
alias less='less -NR'
alias vi='nvim -u NONE'
alias vim='nvim'
alias vimdiff='nvim -d'
alias taginit='ctags -R -f .tags'
alias wl='wc -l'
alias whihc='which'
# infra shortcut
alias o='open .'
alias d='podman'
alias dc='podman compose'
alias docker='podman'
alias p='podman'
alias pd='podman compose'
alias tf='terraform'
alias tg='terragrunt'
alias k='kubectl'
alias kcx='kubectx'
alias kcn='kubens'
# git shortcut
alias g='git'
alias gs='git status'
alias ga='git add .'
alias gap='git add -p'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git push'
alias gd='git diff'
alias gde='git difftool'
alias gb='git branch'
alias gba='git branch -a'
alias gbs='(){ TARGETBRANCH=`git branch -a|sed "s/ *//g"|fzf`; if [ -n ${TARGETBRANCH} ]; then if [[ ${TARGETBRANCH} == "remotes/origin/"* ]]; then TARGETBRANCH=${TARGETBRANCH/remotes\/origin\//}; fi; git checkout $TARGETBRANCH; unset TARGETBRANCH; fi }'
alias gl='git log --stat'
alias glo='git log --oneline'
alias glp='git log -p'
alias glm='git log -m --name-status'
alias gss='(){ if [ -n "${1}" ];then git stash push -u -m $1; else git stash push -u; fi }'
alias gsx='(){ TARGETSTASH=`git stash list|cut -d':' -f1|fzf`; if [ -z ${TARGETSTASH} ];then echo "DROP not done"; else git stash drop ${TARGETSTASH}; unset TARGETSTASH ;fi }'
alias gsl='git stash list'
alias gsd='git diff `git stash list|cut -d':' -f1|fzf`'
alias gsa='(){ TARGETSTASH=`git stash list|cut -d':' -f1|fzf`; if [ -z ${TARGETSTASH} ];then echo "APPLY not done"; else git stash apply ${TARGETSTASH}; unset TARGETSTASH ;fi }'
# gui application
alias vivaldi='open -a vivaldi'
# execute on filetype
alias -s html=vivaldi
alias -s md=vivaldi
alias -s vim='nvim -S'

## zsh config general
# prompt
autoload -U promptinit
promptinit
PROMPT='%F{#5e81ac}%n@%m:%f%~%F{#5e81ac}$%f'
# completion
autoload -Uz compinit && compinit -i
autoload -U +X bashcompinit && bashcompinit
# direnv
if [ ! -z ${EDITOR} ];then
  eval "$(direnv hook zsh)"
fi
# fzf
source <(fzf --zsh)
# -> aws
complete -C '/usr/local/bin/aws_completer' aws
## -> docker
#source <(docker completion zsh)
# -> podman
source <(podman completion zsh)
# -> kubectl
source <(kubectl completion zsh)
# -> helm
source <(helm completion zsh)
# -> argo-cd
source <(argocd completion zsh)
# -> istioctl
source <(istioctl completion zsh)
# -> kyverno
source <(kyverno completion zsh)
# -> tenv (terraform, terragrunt,opentofu, atoms)
source <(tenv completion zsh)
# cd history
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 100
function fzf-cdr() {
  local selected_dir=$(cdr -l | awk '{ print $2 }' | fzf)
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
}
zle -N fzf-cdr
setopt noflowcontrol
bindkey '^y' fzf-cdr
