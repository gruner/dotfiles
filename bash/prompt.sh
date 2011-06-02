# http://blog.bitfluent.com/post/27983389/git-utilities-you-cant-live-without
# http://superuser.com/questions/31744/how-to-get-git-completion-bash-to-work-on-mac-os-x

# 17:39 henrik@Nyx ~/.dotfiles[master*]$ 

# MacPorts git bash completion.
# Required for the prompt. Also provides autocompletion of git commands and branch names.
. ~/Dropbox/gSync/dotfiles/bash/lib/git-completion.bash

export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\t \[\e[1;33m\]\u@\h \[\e[0;33m\]\w\[\e[0m\]\[\e[32m\]$(__git_ps1 "[%s]")\[\e[0m\]$ '

#export PS1="$PS1\n→ "
export PS2="→ "