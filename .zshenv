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
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8 2>/dev/null)
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
source ~/.zshenv_others 2> /dev/null || true
