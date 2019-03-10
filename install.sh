rm ~/.bash_profile
rm ~/.bashrc
rm ~/.bundle
rm ~/.cheat
rm ~/.gemrc
rm ~/.git_template
rm ~/.tmux.conf
rm ~/.bash_profile_helpers

ln -s `pwd`/.bash_profile ~/.bash_profile
ln -s `pwd`/.bashrc ~/.bashrc
ln -s `pwd`/.bundle ~/.bundle
ln -s `pwd`/.cheat ~/.cheat
ln -s `pwd`/.gemrc ~/.gemrc
ln -s `pwd`/.git_template ~/.git_template
ln -s `pwd`/.tmux.conf ~/.tmux.conf
ln -s `pwd`/bash_profile_helpers ~/.bash_profile_helpers

