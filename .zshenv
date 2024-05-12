#!/bin/zsh
#
# .zshenv - Zsh environment file, loaded always.
#

# this file should be placed in the zsh config dir and symlinked into home
export ZDOTDIR=$(dirname $(realpath $0))

# NOTE: .zshenv needs to live at ~/.zshenv, not in $ZDOTDIR!

# issue with wsl ignoring /etc/environment
# https://github.com/microsoft/WSL/issues/1405
export PATH=/snap/bin:$PATH
export PATH=~/bin:$PATH


# You can use .zprofile to set environment vars for non-login, non-interactive shells.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "$ZDOTDIR/.zprofile"
fi
