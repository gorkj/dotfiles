#!/usr/bin/python

import os

directories = ['.i3']
dotfiles = [
    'emacs',
    'alias',
    'i3/autostart',
    'i3/config',
    'profile',
    'vimrc',
    'xprofile'
]

def shall(msg):
    return raw_input("%s (y/N) " % msg).lower() == 'y'

home = os.path.expanduser("~")

for directory in directories:
    dir_path = home + "/" + directory
    if not os.path.exists(dir_path):
        os.mkdir(dir_path, 0755);

for dotfile in dotfiles:
    write_file = True
    dotfile_path = home + "/dotfiles/" + dotfile
    link_path = home + "/." + dotfile

    if os.path.isfile(link_path):
        if not shall(link_path + " exists, overwrite"):
            write_file = False

    if write_file:
        print link_path + " -> " + dotfile_path 
        if os.path.isfile(link_path):
            os.remove(link_path)
        os.symlink(dotfile_path, link_path)


