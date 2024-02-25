# Dotfiles

## Installation

To install these dotfiles, run `./bootstrap.sh`. **Please note**: this will replace existing configuration files in your home directory, so be careful!

Also note that the included `.vimrc` is only there temporarily and is not installed by the `bootstrap.sh` script! I am working on a more complex setup but have a lot of reading + writing to do.

## ZSH

### Performance

On my local machine, zsh is up and ready to use in around 1/20th of a second, as seen below (the `startup_check` function is defined in `.zshrc`):

```shell
~/dev/projects/open-source/dotfiles main*
❯ startup_check 15
  0.03s user 0.02s system 102% cpu 0.047 total
  0.03s user 0.01s system 102% cpu 0.046 total
  0.01s user 0.03s system 103% cpu 0.048 total
  0.02s user 0.02s system 103% cpu 0.047 total
  0.03s user 0.01s system 102% cpu 0.047 total
  0.02s user 0.02s system 102% cpu 0.047 total
  0.02s user 0.03s system 103% cpu 0.047 total
  0.03s user 0.02s system 102% cpu 0.047 total
  0.03s user 0.01s system 103% cpu 0.048 total
  0.03s user 0.02s system 103% cpu 0.047 total
  0.03s user 0.02s system 103% cpu 0.047 total
  0.02s user 0.02s system 102% cpu 0.045 total
  0.03s user 0.02s system 102% cpu 0.047 total
  0.02s user 0.03s system 102% cpu 0.044 total
  0.01s user 0.03s system 102% cpu 0.044 total
```

Note: I used to use [zinit](https://github.com/zdharma-continuum/zinit), and while the initial start-up was faster, the first interactions
with the terminal lagged - I'd often have to wait a few seconds for it to catch up.

### Plugins included

I'm using [zimfw](https://github.com/zimfw/zimfw) as the plugin manager to load in:

* [Pure](https://github.com/sindresorhus/pure) (theme)
* [alias-tips](https://github.com/djui/alias-tips)
* [history-search-multi-word](https://github.com/zdharma-continuum/history-search-multi-word)
* [zsh-autopair](https://github.com/hlissner/zsh-autopair)
* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
* [zsh-completions](https://github.com/zsh-users/zsh-completions)
* [zsh-diff-so-fancy](https://github.com/zdharma-continuum/zsh-diff-so-fancy)
* [zsh-fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting)
* [zsh-history-substring-search](zsh-users/zsh-history-substring-search)
* [zsh-z](https://github.com/agkozak/zsh-z)

I'm loading in a few [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) libraries and plugins as well:

* [git.zsh](https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/git.zsh) (library)
* [colored-man-pages](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/colored-man-pages) (plugin)
* [git](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git) (plugin)
* [git-auto-fetch](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git-auto-fetch) (plugin)
