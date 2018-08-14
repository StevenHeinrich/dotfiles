# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
	[ -r "$file" ] && source "$file"
done
unset file

# init rvm
source ~/.rvm/scripts/rvm

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Use git-completion (if you have it)
# get it like this... curl https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
# if [ -f ~/.git-completion.bash ]; then
#   . ~/.git-completion.bash
# fi
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Terminal Command History Settings
export HISTFILE=/Users/<USERNAME>/.bash_history
export HISTFILESIZE=100000
export HISTSIZE=1000
export HISTIGNORE="&:[ ]*:exit"
