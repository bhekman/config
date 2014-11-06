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

# Force organized, colorized ls
alias ls='ls -Gl'
export CLICOLOR=true
export LSCOLORS=bxfxdxgxcxegedabagacad

# OS SPECIFIC OPTIONS
# For Mac
if [[ "$OSTYPE" == "darwin"* ]]; then
  PATH=$PATH:/usr/local/bin
  # Coloration
  export PS1="\[\033[0;33m\]\u\[\033[0m\]:\[\033[0;33m\]\W\[\033[0m\]$ "
  # Newer vim
  #alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
  # Syntax highlighting
  alias dog="pygmentize -g"
  # MacPorts Installer addition on 2014-10-19_at_21:28:44: adding an appropriate PATH variable for use with MacPorts.
  export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# For Linux
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
  module load gcc
  module load gdb/7.5.1
  export PATH="~/usr/bin:$PATH"
fi

