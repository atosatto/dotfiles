if status is-interactive
    # Commands to run in interactive sessions can go here
end

## Disable fish shell default greetins message
set fish_greeting

## Load startship prompt
starship init fish | source

## Update the path with the location of brew binaries
brew shellenv | source

## Configure "secretive" as ssh-agent
set -x SSH_AUTH_SOCK $HOME/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh

## Configure jumping between most recent directories
zoxide init fish | source

## Ensure golang binaries are added to the path
set -Ux GOPATH "/usr/local/go"
fish_add_path (go env GOROOT)/bin

## Make sure fish can find python
## binaries and dependencies installed via pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
pyenv init - | source
