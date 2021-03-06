# Dotfiles

My dotfiles. I'm not a particularly avid user of tools like vim so for now I only have a `.zshrc` and `.aliases`.

## Performance

On my local machine, zsh is up and ready to use in just under ~0.05s, as seen below (the `startup_check` function is defined in `.zshrc`):

```shell
~/dev/projects/dotfiles master
❯ startup_check 10
  0.16s user 0.05s system 101% cpu 0.209 total
  0.04s user 0.01s system 101% cpu 0.045 total
  0.03s user 0.01s system 100% cpu 0.044 total
  0.03s user 0.01s system 100% cpu 0.044 total
  0.04s user 0.01s system 100% cpu 0.044 total
  0.04s user 0.01s system 100% cpu 0.044 total
  0.04s user 0.01s system 100% cpu 0.045 total
  0.03s user 0.01s system 100% cpu 0.047 total
  0.04s user 0.01s system 100% cpu 0.045 total
  0.04s user 0.01s system 101% cpu 0.044 total
```

I have a similar setup on my work machine and it's slightly slower (but still very fast) there, at just over ~0.10s.

Either way, everything loads in very quickly thanks to [zinit](https://github.com/zdharma/zinit). It's not the easiest plugin manager to learn but I really recommend it if you're looking for a faster shell!

## Plugins included
I'm using [zinit](https://github.com/zdharma/zinit) as the plugin manager to load in:

* [Pure](https://github.com/sindresorhus/pure) (theme)
* [alias-tips](https://github.com/djui/alias-tips)
* [history-search-multi-word](https://github.com/zdharma/history-search-multi-word)
* [zsh-autopair](https://github.com/hlissner/zsh-autopair)
* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
* [zsh-bd](https://github.com/Tarrasch/zsh-bd)
* [zsh-completions](https://github.com/zsh-users/zsh-completions)
* [zsh-diff-so-fancy](https://github.com/zdharma/zsh-diff-so-fancy)
* [zsh-fast-syntax-highlighting](https://github.com/zdharma/fast-syntax-highlighting)
* [zsh-nvm](https://github.com/sindresorhus/zsh-nvm)
* [zsh-z](https://github.com/agkozak/zsh-z)

I'm loading in a few [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) libraries and plugins as well:

* [git.zsh](https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/git.zsh) (library)
* [colored-man-pages](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/colored-man-pages) (plugin)
* [git](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git) (plugin)
* [git-auto-fetch](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git-auto-fetch) (plugin)
