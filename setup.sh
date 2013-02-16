#!/bin/bash
PWD=`/bin/pwd`

function mkdir_if_missing {
  if [ ! -d "$1" ]; then
    mkdir $1
  fi
}
# vim
ln -s $PWD/.vimrc ~/.vimrc
ln -s $PWD/.vim ~/.vim

# tmux
ln -s $PWD/.tmux.conf ~/.tmux.conf

# mpd
mkdir_if_missing ~/.mpd
mkdir_if_missing ~/.mpd/playlists
touch ~/.mpd/tag_cache
touch ~/.mpd/mpd.log
touch ~/.mpd/pid
touch ~/.mpd/state
touch ~/.mpd/sticker.sql
ln -s $PWD/mpd.conf ~/.mpd/mpd.conf

# blueproximity
ln -s $PWD/.blueproximity/away.sh ~/.blueproximity/away.sh
ln -s $PWD/.blueproximity/back.sh ~/.blueproximity/back.sh


# ~/bin scripts
mkdir_if_missing ~/bin
ln -s $PWD/bin/wakeup_screen ~/bin/wakeup_screen
