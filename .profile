export PATH=/usr/local/sbin:$PATH
### For Macports
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi

# Aliases
alias la="ls -a"

# Change prompt color (? mac only)
export PS1="\[\033[0;33m\]\u\[\033[0m\]:\[\033[0;33m\]\W\[\033[0m\]$ "

# Force organized, colorized ls
alias ls='ls -Gl'
export CLICOLOR=true
export LSCOLORS=bxfxdxgxcxegedabagacad

