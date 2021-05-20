### ZSH config
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt autocd                           # Allow changing directories without `cd`
setopt append_history                   # Don't overwrite history
setopt extended_history                 # Record time and duration of commands
setopt share_history                    # Share history between multiple shells
setopt hist_expire_dups_first           # Clear duplicates when trimming internal history
setopt hist_find_no_dups                # Don't display duplicates during searches
setopt hist_ignore_dups                 # Ignore consecutive duplicates
setopt hist_ignore_all_dups             # Remember only one unique copy of the command
setopt hist_reduce_blanks               # Remove superfluous blanks
setopt hist_save_no_dups                # Omit older commands in favor of newer ones

### Bind keys
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
# Change bindings to "^[[A" and "^[[B" for Mac
bindkey "${terminfo[kcuu1]}" history-beginning-search-backward-end
bindkey "${terminfo[kcud1]}" history-beginning-search-forward-end

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

### End of Zinit's installer chunk

### zinit configuration
# Theme
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

# First round of plugins
zinit wait lucid for \
    agkozak/zsh-z \
    hlissner/zsh-autopair \
    Tarrasch/zsh-bd \
    atinit'ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay' \
        zdharma/fast-syntax-highlighting \
    atload'!_zsh_autosuggest_start' \
        zsh-users/zsh-autosuggestions \
    blockf \
        zsh-users/zsh-completions

# Second round of plugins
export NVM_COMPLETION=true
export NVM_LAZY_LOAD=true
export NVM_LAZY_LOAD_EXTRA_COMMAND=('yarn')
zinit wait'1' lucid for \
    atinit'zstyle ":history-search-multi-word" page-size "7"' \
        zdharma/history-search-multi-word \
    as'program' pick'bin/git-dsf' \
        zdharma/zsh-diff-so-fancy \
    djui/alias-tips \
    lukechilds/zsh-nvm

# oh-my-zsh plugins
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit cdclear -q

zinit snippet OMZP::colored-man-pages
zinit snippet OMZP::git-auto-fetch

### Language/CLI tool homes
# eg: export GOROOT=/path/to/GOROOT

### Misc
startup_check () {
    num_of_starts=$1
    for i in $(seq 1 ${num_of_starts:-10}); do time zsh -i -c exit; done
}

### Load aliases
. ~/.aliases

### Set path
export PATH="$PATH:/usr/local/bin"
