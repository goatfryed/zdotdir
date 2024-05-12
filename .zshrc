#!/bin/zsh
#
# .zshrc - Run on interactive Zsh session.
#

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zsh options.
setopt extended_glob

ZDOTDIR=${ZDOTDIR:-~}

# Source zstyles you might use with antidote.
[[ -e $ZDOTDIR/.zstyles ]] && source $ZDOTDIR/.zstyles

# Clone antidote if necessary.
[[ -d $ZDOTDIR/.antidote ]] ||
  git clone https://github.com/mattmc3/antidote $ZDOTDIR/.antidote

# Create an amazing Zsh config using antidote plugins.
source $ZDOTDIR/.antidote/antidote.zsh
antidote load

for file in $ZDOTDIR/conf.d/*.zsh; do
    print sourcing $file
    source "$file"
done

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
