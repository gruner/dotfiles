# MacPorts
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export MANPATH=/opt/local/share/man:/usr/local/man:$MANPATH

# Homebrew
export PATH=~/.homebrew/bin:~/.homebrew/sbin:$PATH
export MANPATH=~/.homebrew/man:$MANPATH

# Ubuntu Ruby gem binaries
# export PATH=/var/lib/gems/1.8/bin:$PATH

# MySQL
export PATH=/usr/local/mysql/bin:$PATH

# RVM: loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

# To get the GUI-less Vim from MacVim:
# ln -s ~/.homebrew/bin/mvim ~/.homebrew/bin/vim
