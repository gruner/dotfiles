# Dirs
alias o="open ."  # OS X, open in Finder

# http://www.hogbaysoftware.com/products/plaintext
# alias text='mvim ~/Dropbox/PlainText'

# Management
alias dots="mvim ~/Dropbox/gSync/dotfiles"
alias reload='source ~/.bash_profile && echo "sourced ~/.bash_profile"'
alias redot='cd ~/Dropbox/gSync/dotfiles && gpp && rake install; cd -'

# Shell
alias c='clear'
alias la='ls -alh'
alias cdd='cd -'  # back to last directory
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# Portable ls with colors
if ls --color -d . >/dev/null 2>&1; then
  alias ls='ls --color=auto'  # Linux
elif ls -G -d . >/dev/null 2>&1; then
  alias ls='ls -G'  # BSD/OS X
fi

# Ruby on Rails
alias sc="[ -f script/console ] && script/console || bundle exec rails console"
alias sdb="[ -f script/dbconsole ] && script/console --include-password || bundle exec rails dbconsole --include-password"
alias ss="[ -f script/server ] && script/server || rails server"
alias at="script/autospec -f -c"
alias cu='script/cucumber features -b -s -f progress'
alias cuf='rake features:focus'
alias mig='rake db:migrate'

# Git
alias gl="git log"
alias gs="git status"
alias gw="git show"
alias gd="git diff"  # What's changed but not yet added?
alias gdc="git diff --cached"  # What's added but not yet committed?
alias gc="git commit -a -m"
alias gco="git commit -m"  # "only"
alias gca="git add . && git commit -a -m"  # "all"
alias gp='git push'
alias gpp='git pull && git push'
alias go="git checkout"
alias gb="git checkout -b"
alias got="git checkout -"
alias gom="git checkout master"
alias gr="git branch -d"
alias grr="git branch -D"
alias gcp="git cherry-pick"
alias gam="git commit --amend"

# Xcode versioning
# http://www.blog.montgomerie.net/easy-iphone-application-versioning-with-agvtool
# alias xv="agvtool what-version; agvtool what-marketing-version"  # Show versions.
# alias xvbump="agvtool bump -all"  # Bump build number.
# alias xvset="agvtool new-marketing-version"  # Set user-visible version: xvset 2.0

# Servers
alias grace='sudo apachectl graceful'
alias rst="touch tmp/restart.txt && echo touched tmp/restart.txt"  # Passenger

# SSH
alias sshbib='ssh biblewor@bibleworm.com'
alias sshdf='ssh divinefl@divineflame.com'
alias sshdiv='ssh divinefl@divineflame.com'
alias sshplc='ssh pilgrim@pilgrimlutheran.org'
alias sshpil='ssh pilgrim@pilgrimlutheran.org'
alias sshgruner='ssh gruner@thegruners.com'
alias sshgru='ssh gruner@thegruners.com'
alias sshag='ssh andreux@andrewgruner.com'
alias sshand='ssh andreux@andrewgruner.com'
alias ssheg='ssh ether@ethergraphics.com'
alias ssheth='ssh ether@ethergraphics.com'
alias sshfb='ssh faithbug@faithbug.com'
alias sshfai='ssh faithbug@faithbug.com'

# Files
alias hosts='sudo vim /etc/hosts'

# Work
