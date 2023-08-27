# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/robe_p/.zshrc'

# fpath=(/home/robe_p/.config/lf $fpath)

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
HISTFILE=~/.zhistory
HISTSIZE=1000000
SAVEHIST=1000000
setopt autocd extendedglob nomatch
unsetopt beep notify
bindkey -v
# End of lines configured by zsh-newuser-install

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#aliases
alias sba="source bin/activate"
alias yd="yt-dlp"
# alias yd='yt-dlp -f "bv*[height<=1080]+ba/b[height<=1080] / wv*+ba/w" -o "~/Videos/%(title)s.%(ext)s"'
# alias yda='yt-dlp -f "ba" -o "~/Music/%(title)s.%(ext)s"'
# alias ls="ls --color=auto"
alias la="ls -la --color=auto"
alias zrc="nvim ~/.config/zsh/.zshrc"
alias tn="nvim ~/Documents/notes.md"
alias grep="grep --color=auto"
alias diff="diff --color"
alias gtc="cd ~/.config"
alias gtd="cd /usr/share/doc"
alias ls="exa -la --icons"
alias e="lfcd"
alias nsxiv="nsxiv -f"
alias fd="fdfind --no-ignore-vcs"

fcd(){
  cd "$(find -type d | fzf)"
}
open(){
  xdg-open "$(find -type f | fzf)"
}
gpath() {
  echo $PWD| tr -d '\n' && echo "$(find -type f | fzf | sed 's/^.//g')"
}

# lf file manager
# source $HOME/.config/lf/lfcd.sh
bindkey -s '^o' 'lfcd\n'  # zsh
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

## fuzzy search
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
