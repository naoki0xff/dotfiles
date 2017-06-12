# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return


#added by me.
#alias for cli/gui tools
alias ls='ls -CF'
alias la='ls -CFal'
alias mv='mv -i'
alias open=cygstart

#setting for cygwin terminal
export LANG=ja_JP.UTF-8
stty stop undef

#prompt customize
export PS1="[\u \w]\\$"

#env settings
export PATH=$PATH:~/scripts/bin
