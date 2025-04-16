bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
alias pacman='sudo pacman'
alias ls='eza --icons -a --group-directories-first'
alias open='xdg-open'
alias al='alacritty --working-directory . &|'
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias flutter='CHROME_EXECUTABLE=chromium flutter'
alias affinity-photo='rum affinity-photo3-wine9.13-part3 $HOME/.wineAffinity wine "$HOME/.wineAffinity/drive_c/Program Files/Affinity/Photo 2/Photo.exe"'
alias off='sudo poweroff'
alias id-open='adb shell dumpsys activity | grep top-activity'
alias srp='source .env/bin/activate'
alias cd='z'
alias lg='lazygit'
export PATH=/usr/local/bin:~/.npm-global/bin:/home/sarah/.local/bin:/home/sarah/.cargo/bin:/home/sarah/.spicetify:/home/sarah/.turso:/home/sarah/go/bin:$PATH
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*,.wine/*.z:*}"'
ANDROID_HOME='/home/sarah/Android/Sdk'
QT_IM_MODULE=ibus
XMODIFIERS=@im=ibus
QT_QPA_PLATFORMTHEME=qt6ct
OLLAMA_MODELS=/data/aicrap 
HSA_OVERRIDE_GFX_VERSION="10.3.0"
parse_git_dirty() {
  git_status="$(git status 2> /dev/null)"
  [[ "$git_status" =~ "Changes to be committed:" ]] && echo -n "%F{green}·%f"
  [[ "$git_status" =~ "Changes not staged for commit:" ]] && echo -n "%F{yellow}·%f"
  [[ "$git_status" =~ "Untracked files:" ]] && echo -n "%F{red}·%f"
}

setopt prompt_subst

NEWLINE=$'\n'

autoload -Uz compinit
compinit


zstyle ':completion:*' menu select


autoload -Uz vcs_info # enable vcs_info
precmd () { vcs_info } # always load before displaying the prompt
zstyle ':vcs_info:git*' formats ' ↣ (%F{254}%b%F{245})' # format $vcs_info_msg_0_

PS1='%F{254}%n%F{245} on %F{153}%(5~|%-1~/⋯/%3~|%4~)%F{245}${vcs_info_msg_0_} $(parse_git_dirty)$NEWLINE%F{254}>%f '

eval "$(zoxide init zsh)"
