# dotfiles
Configuration files for easy syncing between computers for myself and might serve as inspiration for someone else.


## Contents

### install.py
Python script for creating symlinks in the home directory. Does not overwrite existing configuration files without asking.

### emacs
* Emacs configuration suitable for a Vim user.
* The intention is to use Emacs as a better Vim using evil mode.
* The configuration should be cross-platform as far as possible (I'm using a combination of Ubuntu, Windows and Mac OS).
* Installation should be automatic to a large degree. Copying the config and starting a vanilla Emacs should be sufficient.

### vimrc
Vim configuration collected over some years. Installation of plugins is done via NeoBundle which needs to be installed before first run.

### i3
Configuration for the tiling window manager i3. Mostly standard stuff. Tweaked the home row shortcuts to vi-standard.

### profile
Bash configuration. Sources .profile.private if it exists.

### alias
Bash aliases sources from .profile.
Sources .alias.private if it exists.

### xprofile
Just setting keyboard layouts and configuring a shortcut for switching between them.

