zstyle ':compinit' arguments -D -i -u -C -w
zstyle ':completion:*:*:cd-args' ignored-patterns '~'
autoload -U compinit && compinit
bindkey '^I' menu-select "$terminfo[kcbt]" menu-select
bindkey -M menuselect '^I' menu-complete "$terminfo[kcbt]" reverse-menu-complete
