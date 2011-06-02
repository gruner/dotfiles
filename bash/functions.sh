# Calls grep with STDIN closed if in a terminal to avoid the "eternal wait" problem.
# http://gist.github.com/476116

function grep { (tty -s && exec <&-; $(which grep) $@); }


# cd gem
#
#     ~$ cdgem thor
#     ~/.rvm/gems/ree-1.8.7-2010.02/gems/thor-0.14.6$

#
function cdgem {
  cd `rvm gemdir`/gems; cd `ls|grep $1|sort|tail -1`
}


# Print working file.
#
#     henrik@Henrik ~/.dotfiles[master]$ pwf ackrc 
#     /Users/henrik/.dotfiles/ackrc
#
function pwf {
  echo "$PWD/$1"
}


# Create directory and cd to it.
#
#     ~$ mkcd foo/bar/baz
#     ~/foo/bar/baz$
#
function mkcd {
  mkdir -p "$1" && cd "$1"
}


# SSH to the given machine and add your id_rsa.pub or id_dsa.pub to authorized_keys.
#
#     henrik@Nyx ~$ sshkey hyper
#     Password:
#     sshkey done.

function sshkey {
  ssh $1 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys" < ~/.ssh/id_?sa.pub
  echo "sshkey done."
}
