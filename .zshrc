# Lines configured by zsh-newuser-install
# List Requirements Here
## git
#

# Set shell variables
ZSH_FOLDER="$HOME/.zsh"
VIM_FOLDER="$HOME/.vim"

## external plugins
# Create zsh folder and install plugins
if [[ ! -d $ZSH_FOLDER ]]; then
  mkdir $ZSH_FOLDER
fi

if [[ ! -d $ZSH_FOLDER/zsh-autosuggestions ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_FOLDER/zsh-autosuggestions
fi

if [[ ! -d $ZSH_FOLDER/zsh-syntax-highlighting ]]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_FOLDER/zsh-syntax-highlighting
fi

if [[ ! -d $ZSH_FOLDER/z ]]; then
  git clone https://github.com/rupa/z.git  $ZSH_FOLDER/z
fi
PROMPT_LEAN_VIMODE=true
if [[ ! -d $ZSH_FOLDER/lean ]]; then
  git clone https://github.com/miekg/lean.git $ZSH_FOLDER/lean
fi

# Source plugins
source $ZSH_FOLDER/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_FOLDER/lean/lean.plugin.zsh
source $ZSH_FOLDER/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=3' ##Orangish

. $ZSH_FOLDER/z/z.sh
## End of external plugins
## opt is case, symbol stripped
#
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/ajayk/.zshrc'

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

KEYTIMEOUT=1
# Enable vim text Objects as shell functions
## src: http://zshwiki.org/home/zle/vi-mode
autoload -U select-bracketed select-quoted
zle -N select-bracketed
zle -N select-quoted
for km in viopp visual; do
  bindkey -M $km -- '-' vi-up-line-or-history
  for c in {a,i}"${(s..):-\'\"\`\|,./:;+@}"; do
    bindkey -M $km $c select-quoted
  done
  for c in {a,i}${(s..):-'()[]{}<>bB'}; do
    bindkey -M $km $c select-bracketed
  done
done

## Aliases
alias ls='ls -G' ##Mac OS X Only. TODO conditionalize
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory hist_ignore_space hist_ignore_all_dups histsavenodups
setopt histsavenodups
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion
alias config='/usr/bin/git --git-dir=/Users/ajayk/.cfg/ --work-tree=/Users/ajayk'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
