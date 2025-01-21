export ZSH_AUTOSUGGEST_MANUAL_REBIND=foo
export ZSH_AUTOSUGGEST_USE_ASYNC=foo
export GOPATH="$HOME/go"
export EDITOR="nvim"
export VISUAL="nvim"
export EDITOR_NO_WAIT="nvim"
export PATH="/usr/local/sbin:$PATH:$GOPATH/bin"
export PROMPT_LEAN_VIMODE=true
export FZF_COMPLETION_TRIGGER=''
export FZF_DEFAULT_COMMAND='git ls-files -c --others --exclude-standard || rg --files'
export FZF_CTRL_T_COMMAND='rg --files'
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"
# export JAVA_HOME=$(/usr/libexec/java_home -v 1.8 2>/dev/null)
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=/usr/local/smlnj/bin:"$PATH"
export PATH="$HOMEBREW_PREFIX/opt/luajit-openresty/bin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/libpq/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
export CONFIG_DIR="$HOME/.config"
export ZSH_PLUGINS_DIR="$HOME/.local/share/zsh/plugins"
export TMUX_PLUGINS_DIR="$HOME/.local/share/tmux/plugins"
export GPG_TTY=`tty`
# Required for installing rocks on nvim (needs `python` on PATH) (mac specific I guess)
# https://stackoverflow.com/questions/5157678/how-do-i-use-brew-installed-python-as-the-default-python
export PATH="/opt/homebrew/opt/python/libexec/bin:$PATH"
export PATH="/Users/ajayvigneshk/Library/Python/3.9/bin:$PATH"
export NNN_OPTS="dADC"
export NNN_ORDER="t:$HOME/Downloads;t:$HOME/remote/code/tiger/work_dir"
source ~/.zshenv_others 2> /dev/null || true
. "$HOME/.cargo/env"
