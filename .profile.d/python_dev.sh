export PYTHONDONTWRITEBYTECODE=1
[ -f /etc/pip.conf ] && export PIP_CONF_FILE="/etc/pip.conf"
[ -f ~/.pip/pip.conf ] && export PIP_CONF_FILE="~/.pip/pip.conf"
[ -f /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh
[ -f ~/.local/bin/virtualenvwrapper.sh ] && source ~/.local/bin/virtualenvwrapper.sh
[ -d ~/.local/bin/ ] && export PATH="$PATH:~/.local/bin/"
