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
alias la='ls -a'
alias dog='pygmentize -g'

# Change prompt color (? mac only)
export PS1="\[\033[0;33m\]\u\[\033[0m\]:\[\033[0;33m\]\W\[\033[0m\]$ "

# Force organized, colorized ls
alias ls='ls -Gl'
export CLICOLOR=true
export LSCOLORS=bxfxdxgxcxegedabagacad


##
# Your previous /Users/bradleyhekman/.profile file was backed up as /Users/bradleyhekman/.profile.macports-saved_2014-10-19_at_21:28:44
##

# MacPorts Installer addition on 2014-10-19_at_21:28:44: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

