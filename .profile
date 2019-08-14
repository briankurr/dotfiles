#!/bin/bash

source ~/.git-completion.bash

export CLICOLOR=1
export LSCOLORS=Fafacxdxbxegedabagacad
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/bin:/Library/PostgresSQL/11/bin"

# PROMPT STUFF
SEAFOAM=$(tput setaf 44);
YELLOW=$(tput setaf 226);
RESET=$(tput sgr0);

function git_branch {
  # Shows the current branch if in a git repository
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \(\1\)/';
}

setColorScheme () {
  PS1="${SEAFOAM}\w${YELLOW}\$(git_branch)${RESET} $\n ";
}

setColorScheme

# docker aliases
alias dc="docker-compose"
alias docker-stop='docker stop $(docker ps -q)'
alias docker-clean='docker-stop; docker rm $(docker ps -aq)'
alias docker-vclean='docker-clean; docker volume prune -f'
alias docker-deep-clean='docker-vclean; docker network rm $(docker network ls -f driver=bridge -q)'
alias docker-prune='docker prune -fa --volumes'
alias docker-remove-all-images='echo ${message}; docker-deep-clean; docker rmi $(docker image ls -q)'

# other aliases
alias jn="jupyter notebook"
alias pqsl_dev="psql -h localhost dev -U postgres -p 5432"

# Setting PATH for Python 3.6
# The original version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH
