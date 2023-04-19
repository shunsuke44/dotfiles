# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

[[ -d /opt/homebrew ]] && eval $(/opt/homebrew/bin/brew shellenv)

# if running bash
if [[ -n "$BASH_VERSION" ]]; then
    # include .bashrc if it exists
    if [[ -f "$HOME/.bashrc" ]]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"

# set PATH so it includes user's private bin if it exists
[[ -d "$HOME/.local/bin" ]] && PATH="$HOME/.local/bin:$PATH"

if [[ -d "$HOME/.volta" ]]; then
    export VOLTA_HOME="$HOME/.volta"
    export PATH="$VOLTA_HOME/bin:$PATH"
fi
