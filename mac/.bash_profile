#just to load .bashrc
source ~/.bashrc

#reflection of added PATH
export PATH=$PATH:/applications/macvim.app/contents/bin
export PATH=$PATH:~/scripts/bin
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:$PATH"

#activation of -env
eval "$(rbenv init -)"
eval "$(pyenv init -)"
