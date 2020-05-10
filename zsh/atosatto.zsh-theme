#!/usr/bin/env zsh

# ------------------------------------------------------------------------------
#
# atosatto - ZSH Theme
#
# Author: Andrea Tosatto
# https://github.com/atosatto/dotfiles
#
# ------------------------------------------------------------------------------

function _prompt_char() {

	echo -n "%(?..%F{1})"
	
	local welcome_symbol='$'
	[ $EUID -ne 0 ] || welcome_symbol='#'
	
	echo -n $welcome_symbol
	echo -n "%(?..%f)"
}

ZSH_THEME_GIT_PROMPT_PREFIX="%b%F{yellow}%K{${bkg}}%}<%{%B%F{blue}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%F{yellow}%K{${bkg}}%}>%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%B%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

_get_prompt() {
	echo -n "%B%F{green}%n%f" # User
	echo -n "%B%F{blue}@%f" # at
	echo -n "%B%F{cyan}%m%f" # Host
	echo -n " %b%F{yellow}%K{${bkg}}%}%~" # Dir
	echo -n " $(git_prompt_info)" # Git branch
	echo -n "\n"
	echo -n "$(_prompt_char)%{%f%k%b%} " # $ or #
}

PROMPT='$(_get_prompt)'
