# ZSH History
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

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

### zinit configuration
# plugins
zinit for \
        light-mode  pick"async.zsh" src"pure.zsh" \
            sindresorhus/pure \
        light-mode  hlissner/zsh-autopair \
        light-mode  agkozak/zsh-z \
        light-mode  zdharma/fast-syntax-highlighting \
                    zdharma/history-search-multi-word \
        light-mode  as"program" pick"bin/git-dsf" \
            zdharma/zsh-diff-so-fancy \
        light-mode  zsh-users/zsh-completions \
        light-mode  wait"3" atload"_zsh_autosuggest_start" lucid \
            zsh-users/zsh-autosuggestions

# oh-my-zsh
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit cdclear -q

zinit snippet OMZP::colored-man-pages
zinit snippet OMZP::git-auto-fetch

# Load aliases
. ~/.aliases

# Language/CLI tool homes
# eg: export GOROOT=/path/to/GOROOT

# Set path
export PATH="$PATH:/usr/local/bin"
