# paragon

My personal minimalistic Vim/Neovim colour scheme based on
[paramount](https://github.com/owickstrom/vim-colors-paramount),
also taking inspiration from
[Chinmay Dalal's alabaster port for Neovim](https://sr.ht/~p00f/alabaster.nvim).

_For those with high virtue._

![Dark mode](https://github.com/seandewar/paragon.vim/assets/6256228/a9df29e6-2ea9-4f3c-91d0-74f4597f21e4)
![Light mode](https://github.com/seandewar/paragon.vim/assets/6256228/a28053f1-046a-43ff-b965-80674f0cdfb9)

Paragon primarily only highlights code comments and literals, selections, diff
changes and status messages. To avoid code that looks like clown puke (and
because Vim syntax files *love* to misuse the built-in highlight groups for
unrelated constructs, which I prefer not to work around) other highlights are
sparingly used.

For Neovim users, it also defines tree-sitter and LSP semantic highlights for
the built-in client, with the assumption that you're using Nvim v0.11+. These
definitions do *not* aim to make things more colourful, but can provide more
accurate code highlights than those assigned by Vim's syntax files.

## Installation and Configuration

Install like any other plugin, then add to your configuration file:

```
" Vim script:
colorscheme paragon

-- Neovim Lua:
vim.cmd.colorscheme "paragon"
```

If you prefer to use your terminal's background colour instead, add the
following **before** `:colorscheme paragon`:

```
" Vim script:
let g:paragon_transparent_bg = 1

-- Neovim Lua:
vim.g.paragon_transparent_bg = true
```

If you dislike some highlights, feel free to override them in a `ColorScheme`
autocommand. For example, to change the cursor line colour to a *very*
uncomplimentary pink, add this **before** `:colorscheme paragon`:

```
" Vim script:
autocmd ColorScheme paragon highlight CursorLine guibg=#ff69b4 ctermbg=13

-- Neovim Lua:
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "paragon",
    command = "highlight CursorLine guibg=#ff69b4 ctermbg=13",
})
```

It may be possible that some highlights *objectively* suck, or that some plugins
are highlighted inadequately with this theme (as I personally don't use many
plugins); feel free to throw me a pull request to improve such issues!

### Neovim's "linking to Normal" priority bug

Nvim has [a long-standing issue](https://github.com/neovim/neovim/issues/9019)
that may cause unwanted "gaps" in the cursor line and in floating windows when
not using a transparent background colour.

If you are using Nvim v0.9+, paragon works around this issue by resolving and
removing `ctermbg` and `guibg` attributes from all highlight groups that link to
`Normal` when sourced.

However, if this workaround is causing problems, it can be disabled by adding
the following **before** `:colorscheme paragon`:

```
" Vim script:
let g:paragon_nvim_priority_fix = 0

-- Neovim Lua:
vim.g.paragon_nvim_priority_fix = false
```

## What's with the name?

Unlike paramount, the name has no deep meaning. The name was chosen because it
sounds cool and begins with the letter "p", like paramount. However
[@3N4N](https://github.com/3N4N) came up with a great alternative interpretation
of the name:

> Well paragon means people with high virtue.
> It's similar, like, in a metaphorical sense. :)

So I'll roll with that. 😇
