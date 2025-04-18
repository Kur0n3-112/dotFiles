#->Dirs
export ZSH_CONFIG_DIR="$HOME/.config/zsh"
export KurScriptsDir="$HOME/Documentos/Scripts/KurFolder"
export RedditScriptsDir="$HOME/Documentos/Scripts/RedditFolder"
export OrgFilesDir="$HOME/Documentos/org"

#->Type of movement
set -o vi

#->Source global shell alias & variables files
[ -f "$XDG_CONFIG_HOME/shell/alias" ] && source "$XDG_CONFIG_HOME/shell/alias"
[ -f "$XDG_CONFIG_HOME/shell/vars" ] && source "$XDG_CONFIG_HOME/shell/vars"

#-> Load modules
zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors
# autoload -U tetris # main attraction of zsh, obviously

#->Cmp opts
zstyle ':completion:*' menu select # tab opens cmp menu
zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu
# zstyle ':completion:*' file-list true # more detailed list
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion

#->Main opts
setopt append_history inc_append_history share_history # better history
# on exit, history appends rather than overwrites; history is appended as soon as cmds executed; history shared across sessions
setopt auto_menu menu_complete # autocmp first menu match
setopt autocd # type a dir to cd
setopt auto_param_slash # when a dir is completed, add a / instead of a trailing space
setopt no_case_glob no_case_match # make cmp case insensitive
setopt globdots # include dotfiles
setopt extended_glob # match ~ # ^
setopt interactive_comments # allow comments in shell
unsetopt prompt_sp # don't autoclean blanklines
stty stop undef # disable accidental ctrl s

#-> Autostart scripts
# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
#pokemon-colorscripts -r
$HOME/Documentos/03_Code/C/quotes/./showQuote

#->Fzf setup
source <(fzf --zsh) # allow for fzf history widget

#->Keybinds
bindkey "^B" backward-word
bindkey "^F" forward-word
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^H" fzf-history-widget
bindkey -s "^T" 'tmux-sessionizer-run\n'

#->History opts
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$XDG_CACHE_HOME/zsh_history" # move histfile to cache
HISTCONTROL=ignoreboth # consecutive duplicates & commands starting with space are not saved

#->Aliases
# force zsh to show the complete history
alias history="history 0"

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# aliases for bat
alias cat='bat'

#aliases for Flatpak Apps
alias obs='flatpak run com.obsproject.Studio'
alias discord='flatpak run com.discordapp.Discord'
alias codium='flatpak run com.vscodium.codium'

#aliases for lsd
alias ls='lsd'
alias l='ls'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

#alias for fileEditor
alias notepad='gedit'

#alias for vm remote viewer session
alias vmScreens="$KurScriptsDir/vm_manager/startRemoteViewer.sh"

#alias for explorer
alias fileExplorer='thunar'

#alias for see images in terminal
alias seeImage='kitty icat'

#alias for cleaning ipc services running
#alias kill_ipcs='$HOME/Documentos/Scripts/./kill_ipcs.sh'

#path for doom emacs
export PATH="$HOME/.config/emacs/bin:$PATH"

#alias for emacs doom
#-> open in Emacs GUI, apart from the term.
#alias ed='doom run'
#alias edA="doom run $OrgFilesDir/kurOrgFiles/ToDo.org"
#-> same but for emacs client
alias ed="emacsclient -c -a 'emacs'"
alias edA="emacsclient -c -a 'emacs' $OrgFilesDir/kurOrgFiles/ToDo.org"
#-> open in the term.
alias edt='doom run -nw'
alias edtA="doom run -nw $OrgFilesDir/kurOrgFiles/ToDo.org"

#alias for changing the ufw rules
alias ufwChangeRules='sudo nvim /etc/ufw/before.rules'

#alias for timer script
alias timer="$KurScriptsDir/alarm/./timer.sh"

#alias for NeoVim
alias nv='nvim'

#alias for Tree Function
#-> if you write the PID after the command pidTree you can see only the subprocesses that creates a determinate process
alias pidTree='pstree -aps'

#alias for copy the files between org folders
alias cpORGLocalToSync="$KurScriptsDir/cpOrg/cpLocalToSync.sh"
alias cpORGSyncToLocal="$KurScriptsDir/cpOrg/cpSyncToLocal.sh"

#alias for showing my schedule
alias horario='kitty icat ~/Documentos/Horario_SoloMisHoras.png'

#alias for deleting all the documents that are not .tex
alias rmTex="$KurScriptsDir/rmTex.sh"

alias latexToPdf="latexmk -interaction=nonstopmode -pdf"

#alias for deleting all the content of the cliphist history
alias rmCliphist="$KurScriptsDir/rmAllCliphistContent.sh"

#alias for python
alias py='python'
alias py3='python3'

#alias for ranger
alias rn='ranger'

#alias for script fix kbd layout
alias kbdLayoutFix="$KurScriptsDir/fix/kbdLayoutFix.sh"

#alias for script controlls bridge connection for Qemu/KVM
alias nmcliBridge="$KurScriptsDir/nmcli/nmcliBridge.sh"

#alias for tmux-sessionizer
export PATH="$HOME/Descargas/gitClone/tmux-sessionizer:$PATH"
alias cpTmuxResurrectLocalToSync="$KurScriptsDir/cpTmuxResurrectLocalToSync.sh"
alias cpTmuxResurrectSyncToLocal="$KurScriptsDir/cpTmuxResurrectSyncToLocal.sh"

alias mpv1080='mpv --ytdl-format="bestvideo[height<=1080]+bestaudio/best"'

alias minman='tldr'

eval "$(zoxide init --cmd cd zsh)"

function tmux-sessionizer-run(){
    $HOME/Descargas/gitClone/tmux-sessionizer/tmux-sessionizer
}

#-> Gruvbox color Scheme
GRUVBOX_BACKGROUND="%F{235}"  # Dark gray
GRUVBOX_FOREGROUND="%F{245}"  # Light gray
GRUVBOX_GREEN="%F{106}"       # Green
GRUVBOX_AQUA="%F{108}"        # Water green
GRUVBOX_ACCENT="%F{124}"      # Red
GRUVBOX_YELLOW="%F{172}"      # Yellow
GRUVBOX_BLUE="%F{66}"         # Blue
GRUVBOX_PURPLE="%F{129}"      # Purple

#-> Configure the prompt of the shell 
#> Colorfull
NEWLINE=$'\n'
PS1="${NEWLINE}$GRUVBOX_AQUA%n@%m$GRUVBOX_GREEN %~ %# -> "
#RPROMPT="${NEWLINE}$GRUVBOX_GREEN $(date +%_I:%M%P) $GRUVBOX_FOREGROUND"  # hour at the right
RPROMPT="$GRUVBOX_GREEN %t $GRUVBOX_FOREGROUND"  # hour at the right

#> Colorless
#PROMPT="%n@%m %~ %# -> "
#RPROMPT="$(date +%_I:%M%P)"  # hour at the right

#->Preconfig theme
#source $ZSH_CONFIG_DIR/themes/nicoulaj.zsh-theme

#-> Addons/Plugins Config
# enable auto-suggestions based on the history
if [ -f /usr/share/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    . /usr/share/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
    # change suggestion color
#    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
fi

if [ -f /usr/share/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    . /usr/share/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# enable command-not-found if installed
if [ -f /etc/zsh_command_not_found ]; then
    . /etc/zsh_command_not_found
fi

## Si estamos saliendo de tmux, restaurar el cursor de Kitty
#if [ -z "$TMUX" ]; then
#  # Enviar la secuencia para restaurar el cursor a su configuración predeterminada
#  echo -e '\033[1 q'
#fi

