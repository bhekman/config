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
source $HOME/.aliases

# OS SPECIFIC OPTIONS
# For Mac
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Configuring .profile for MacOSX"
  # Because local bin..
  export PATH=$PATH:/usr/local/bin
  # For pip installations
  export PATH=$PATH:/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin/

  # Command Prompt
  # Coloration (worked for bash, not zsh)
  #export PS1="\[\033[0;33m\]\u\[\033[0m\]:\[\033[0;33m\]\W\[\033[0m\]$ "
  #export PS1="[%n@%m:%/]%#"

  # Use Newer vim
  alias vi="/Applications/MacVim.app/Contents/MacOS/Vim"
  alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
  # Syntax highlighting
  alias dog="pygmentize -g"
  # MacPorts Installer addition on 2014-10-19_at_21:28:44: adding an appropriate PATH variable for use with MacPorts.
  export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
  # Store location of cookiecutter repo
  export MYCOOKIE="/Users/bradleyhekman/Dropbox/Techy/Projects/cookiecutter-pypackage"

# For Linux
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
  echo "Configuring .profile for Linux"
  module load gcc
  module load gdb/7.5.1
  export PATH="~/usr/bin:$PATH"
fi

