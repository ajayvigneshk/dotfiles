# Lines configured by zsh-newuser-install
# List Requirements Here
## git
## rg
#
## Uncomment to profile the config
#zmodload zsh/zprof
# Set shell variables

## external plugins
# Create zsh folder and install plugins
if [[ ! -d $ZSH_PLUGINS_DIR ]]; then
  mkdir -p $ZSH_PLUGINS_DIR
fi

if [[ ! -d $NVM_DIR ]]; then
  mkdir -p $NVM_DIR
fi
if [[ ! -d $ZSH_PLUGINS_DIR/zsh-autosuggestions ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_PLUGINS_DIR/zsh-autosuggestions
fi

if [[ ! -d $ZSH_PLUGINS_DIR/zsh-syntax-highlighting ]]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_PLUGINS_DIR/zsh-syntax-highlighting
fi

if [[ ! -d $ZSH_PLUGINS_DIR/z ]]; then
  git clone https://github.com/rupa/z.git  $ZSH_PLUGINS_DIR/z
fi
if [[ ! -d $ZSH_PLUGINS_DIR/lean ]]; then
  git clone https://github.com/miekg/lean.git $ZSH_PLUGINS_DIR/lean
fi
##Install tpm
if [[ ! -d $TMUX_PLUGINS_DIR/tpm ]]; then
  git clone https://github.com/tmux-plugins/tpm $TMUX_PLUGINS_DIR/tpm
fi
## Install minpac
if [[ ! -d $HOME/.config/nvim/pack/minpac/opt/minpac ]]; then
  git clone https://github.com/k-takata/minpac.git $HOME/.config/nvim/pack/minpac/opt/minpac
fi

# Source plugins
source $ZSH_PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_PLUGINS_DIR/lean/lean.plugin.zsh
source $ZSH_PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=3' ##Orangish

source $ZSH_PLUGINS_DIR/z/z.sh
## End of external plugins
## opt is case, symbol stripped
#
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit promptinit
compinit
promptinit
# End of lines added by compinstall
# Manually added
## Source http://zshwiki.org/home/zle/bindkeys

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
bindkey -v
typeset -A key

key[Home]="$terminfo[khome]"
key[End]="$terminfo[kend]"
key[Insert]="$terminfo[kich1]"
key[Backspace]="$terminfo[kbs]"
key[Delete]="$terminfo[kdch1]"
key[Up]="$terminfo[kcuu1]"
key[Down]="$terminfo[kcud1]"
key[Left]="$terminfo[kcub1]"
key[Right]="$terminfo[kcuf1]"
key[PageUp]="$terminfo[kpp]"
key[PageDown]="$terminfo[knp]"

# setup key accordingly
[[ -n "$key[Home]"      ]] && bindkey -- "$key[Home]"      beginning-of-line
[[ -n "$key[End]"       ]] && bindkey -- "$key[End]"       end-of-line
[[ -n "$key[Insert]"    ]] && bindkey -- "$key[Insert]"    overwrite-mode
[[ -n "$key[Backspace]" ]] && bindkey -- "$key[Backspace]" backward-delete-char
[[ -n "$key[Delete]"    ]] && bindkey -- "$key[Delete]"    delete-char
[[ -n "$key[Up]"        ]] && bindkey -- "$key[Up]"        up-line-or-beginning-search
[[ -n "$key[Down]"      ]] && bindkey -- "$key[Down]"      down-line-or-beginning-search
[[ -n "$key[Left]"      ]] && bindkey -- "$key[Left]"      backward-char
[[ -n "$key[Right]"     ]] && bindkey -- "$key[Right]"     forward-char

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        echoti smkx
    }
    function zle-line-finish () {
        echoti rmkx
    }
    zle -N zle-line-init
    zle -N zle-line-finish
    autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
    zle -N up-line-or-beginning-search
    zle -N down-line-or-beginning-search
    autoload  edit-command-line
    zle -N edit-command-line
fi
## End Source zshwiki
## Source : Arch Wiki

#prompt walters
zstyle ':completion:*' menu select
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search

## Src: https://dougblack.io/words/zsh-vi-mode.html
# Use vim cli mode
bindkey '^P' up-history
bindkey '^N' down-history

# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

bindkey '^ ' forward-word
bindkey '^A' vi-beginning-of-line
bindkey '^E' vi-end-of-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

KEYTIMEOUT=1
# Enable vim text Objects as shell functions
## src: https://www.reddit.com/r/vim/comments/4995nr/navigate_your_command_line_with_modal_vi/d0qmcbl?utm_source=share&utm_medium=web2x
#enable parens, quotes and surround text-objects
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
	for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
		bindkey -M $m $c select-bracketed
	done
done

autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
	bindkey -M $m $c select-quoted
  done
done

#autoload -Uz surround
#zle -N delete-surround surround
#zle -N change-surround surround
#zle -N add-surround surround
#bindkey -a cs change-surround
#bindkey -a ds delete-surround
#bindkey -a ys add-surround
#bindkey -M visual S add-surround

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory hist_ignore_space hist_ignore_all_dups histsavenodups
setopt histsavenodups histignorespace
fpath=( ~/.config/zsh/functions "${fpath[@]}" )
autoload -Uz fzfdefaultopts
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion
fzfdefaultopts
## load individual config files
typeset -U config_files
config_files=($CONFIG_DIR/zsh/*.zsh)
# load config files
for file in ${config_files}
do
  source $file
done
#if [ -z "$TMUX" ]; then
#    tmux attach -t default || tmux new -s default
#fi
if [[ ! (-f $HOME/.config/alacritty/alacritty.yml && -f $HOME/.config/nvim/init.vim && -f $HOME/.tmux.conf)  ]]; then
    $HOME/.config/myscripts/detemplatise.sh dark
fi
source $CONFIG_DIR/zsh/.aliases
