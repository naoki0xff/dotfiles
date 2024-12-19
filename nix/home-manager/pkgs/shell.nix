{ config, pkgs, ... }:

{
  program.zsh = {
    enable = true;

    sessionVariables = {
    };

    shellAliases = {
      # General
      ls      = "ls -CF";
      sl      = "ls -CF";
      ll      = "ls -1";
      lt      = "ls -1t";
      la      = "ls -CFalh";
      lls     = "tree -N -L 2";
      lla     = "tree -a -h -N -L 2";
      mv      = "mv -i";
      cp      = "cp -i";
      whihc   = "which";
      wl      = "wc -l";
      mkdir   = "mkdir -p";
      grep    = "grep --color=auto";
      sed     = "gsed";
      diff    = "colordiff -u";
      less    = "less -NR";
      fzf     = "fzf-tmux";
      hm      = "home-manager";

      # Editor
      vi      = "nvim -u NONE";
      vim     = "nvim";
      vimdiff = "nvim -d";
      taginit = "ctags -R -f .tags";

      # Git
      gs      = "git status";
      ga      = "git add";
      gc      = "git commit";
      gcm     = "git commit -m";
      gp      = "git push";
      gd      = "git diff";
      gb      = "git branch";
      gba     = "git branch -a";
#TODO: make those too long oneliner to escaped multi line
      gbs     = "(){ TARGETBRANCH=`git branch -a | sed 's/ *//g' | fzf-tmux -p`; if [ -n ${TARGETBRANCH} ]; then if [[ ${TARGETBRANCH} == 'remotes/origin/'* ]]; then TARGETBRANCH=${TARGETBRANCH/remotes\/origin\//}; fi; git checkout $TARGETBRANCH; unset TARGETBRANCH; fi }";
      gl      = "git log --stat";
      glo     = "git log --oneline";
      glp     = "git log -p";
      glm     = "git log -m --name-status";
      gss     = "(){ if [ -n '${1}' ];then git stash push -u -m $1; else git stash push -u; fi }";
      gsx     = "(){ TARGETSTASH=`git stash list | cut -d':' -f1 | fzf-tmux -p`; if [ -z ${TARGETSTASH} ]; then echo 'DROP not done'; else git stash drop ${TARGETSTASH}; unset TARGETSTASH ;fi }";
      gsl     = "git stash list";
      gsd     = "git diff `git stash list | cut -d':' -f1 | fzf-tmux -p`";
      gsa     = "(){ TARGETSTASH=`git stash list | cut -d':' -f1 | fzf-tmux -p`; if [ -z ${TARGETSTASH} ]; then echo 'APPLY not done'; else git stash apply ${TARGETSTASH}; unset TARGETSTASH ;fi }";

      # Development
      o       = "open .";
      d       = "podman";
      dc      = "podman compose";
      docker  = "podman";
      p       = "podman";
      pd      = "podman compose";
      tf      = "terraform";
      tg      = "terragrunt";
      k       = "kubectl";
      kcx     = "kubectx";
      kcn     = "kubens";
    };
  };
}
