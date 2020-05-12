#!/usr/bin/env zsh

# atosatto - ZSH Theme
#
# Author: Andrea Tosatto
# https://github.com/atosatto/dotfiles

# ----------------------------------------------------------------------------
# GIT specific colors and icons
# ----------------------------------------------------------------------------

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[green]%}[%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[green]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}§%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}+%{$reset_color%}"

# ----------------------------------------------------------------------------
# virtualenv settings
# ----------------------------------------------------------------------------

# Disable the standard pyenv prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

function venv_info {
  if [[ ! -z "$VIRTUAL_ENV" ]]; then
    # Show this info only if virtualenv is activated:
    local virtualenv=$(basename "$VIRTUAL_ENV")
    echo -n "%{$fg[green]%}(%{$reset_color%}"
    echo -n "🐍 %{$fg[green]%}${virtualenv}%{$reset_color%}"
    echo -n "%{$fg[green]%})%{$reset_color%}"
  fi
}

#

# ----------------------------------------------------------------------------
# Kubernetes context and namespace
# ----------------------------------------------------------------------------

function k8s_info {
  local context="$(kubectl config current-context 2>/dev/null)"
  local namespace="$(kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null)"

  if [[ ! -z "$context" ]]; then
    echo -n "%{$fg[blue]%}(%{$reset_color%}"
    echo -ne "%{$fg_bold[blue]%}⎈ %{$reset_color%} %{$fg[blue]%}${namespace:-default}|$context%{$reset_color%}"
    echo -n "%{$fg[blue]%})%{$reset_color%}"
  fi
}

# ----------------------------------------------------------------------------
# Prompt settings
# ----------------------------------------------------------------------------

function user_info {
  echo -n "%{$fg_bold[green]%}$USER%{$fg_bold[blue]%}@%{$fg_bold[cyan]%}%m%{$reset_color%}" # user@host
}

function current_dir {
  echo -n "%{$fg[yellow]%}%~%{$reset_color%}" # ~/path
}

function prompt_caret {
  local caret="$"
  if [[ $EUID -eq 0 ]]; then
    caret="#"
  fi

  echo -n "%(?..$fg[red])$caret%(?..$reset_color)"
}

PROMPT='$(user_info) $(current_dir) $(git_prompt_info)
$(prompt_caret) '

RPROMPT='%{$(echotc UP 1)%} $(venv_info) $(k8s_info) ${_return_status}%{$(echotc DO 1)%}'
