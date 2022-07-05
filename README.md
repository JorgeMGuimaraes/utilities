# Utilities
Linux unitilies, scripts, start serviices, etc.

## Setup

    # clone project to desktop
    cd $HOME
    remote=git@github.com:JorgeMGuimaraes/utilities.git
    git clone $remote

    # make a link to .bin folder
    ln -s utilities/bin $HOME

    # export new path to $PATH
    # bash
    cp .bashrc .bashrc.old
    echo "export PATH=\$PATH:\$HOME/bin" >> .bashrc
    source .bashrc
    exit

## Desktop Utilities

### dthelp

Prints a list of all commands.

    bin/dthelp

### dtup

Prints Gentoo update/upgrade 'cheat sheet'.

    bin/dtup

### dtvm

Initiate libvirt service and start Virt Manager.

    bin/dtvm

### dtprint

Initiate CUPS service.

    bin/dtprint

### dtvol

Shortcut to alsamixer on new window.

    bin/dtvol

### dtgit

List (Oh My Zsh)-Git useful shortcuts.

    bin/dtgit

### dtss

Takes a screenshot and saves it to a directory.

    bin/dtss

### dtdd

Safer attempt to dd command, asking before acting

    bin/dtdd

## Scripts

### ssh_keygen.sh

Generates a new key based on some standards

    scripts/ssh_keygen.sh

## TODO

- [] Change python shebangs to #!/usr/bin/env python3
