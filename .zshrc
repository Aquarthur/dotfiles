# Load aliases
. ~/.aliases

# Language/CLI tool homes
# eg: export GOROOT=/path/to/GOROOT

# Set path
export PATH="$PATH:/usr/local/bin"

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
source "$HOME/.zinit/bin/zinit.sh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit installer's chunk

# zinit configuration
# theme
zinit lucid pick"/dev/null" multisrc"{async,pure}.zsh" atload"!promt_pure_precmd" nocd for sindresorhus/pure

# oh-my-zsh
zinit ice wait"0" lucid
zinit snippet OMZ::plugins/git.zsh

zinit ice wait"0" lucid
zinit snippet OMZ::plugins/git/git.plugin.zsh

zinit ice wait"0" lucid
zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

zinit ice wait"0" lucid
zinit snippet OMZ::plugins/git-auto-fetch/git-auto-fetch.plugin.zsh

# zdharma
zinit ice wait"0" lucid atinit"zpcompinit; zpcdreplay"
zinit light zdharma/fast-syntax-highlighting

zinit ice wait"0" lucid
zinit light zdharma/history-search-multi-word

# other
zinit ice wait"0" from"gh-r" as"program" lucid
zinit light sei40kr/fast-alias-tips-bin
zinit light sei40kr/zsh-fast-alias-tips

zinit ice wait"0" atload"_zsh_autosuggest_start" lucid
zinit light zsh-users/zsh-autosuggestions

zinit ice wait"0" blockf lucid
zinit light zsh-users/zsh-completions