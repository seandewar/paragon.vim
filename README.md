# paragon

My personal minimalistic Vim/Neovim colour scheme based on
[paramount](https://github.com/owickstrom/vim-colors-paramount).

_For those with high virtue._

![Dark mode](https://user-images.githubusercontent.com/6256228/234618757-11b083ca-b961-435c-8f5f-98061ca0b0b0.png)
![Light mode](https://user-images.githubusercontent.com/6256228/234671568-8ee81562-22ce-4f77-80fa-b86aaf0b57d5.png)

Paragon (like paramount), aims to highlight only the important things in code
(such as keywords, literals, comments, etc.) while not looking too monochrome or
like clown puke.

For Neovim users, it also defines tree-sitter and semantic tokens highlights
for the built-in LSP client (while still using minimal colours), with the
assumption that you're using Neovim v0.9+.

## Installation and Configuration

Install like any other plugin, then add to your configuration file:

```
" Vim script:
colorscheme paragon

-- Neovim Lua:
vim.cmd.colorscheme "paragon"
```

To use a transparent background colour, add the following **before** the
`:colorscheme` command above:

```
" Vim script:
let g:paragon_transparent_bg = 1

-- Neovim Lua:
vim.g.paragon_transparent_bg = true
```

If you think some of the highlights suck, feel free to override them with a
`ColorScheme` autocommand.

For example, to change the cursor line colour to a very uncomplimentary pink,
add the following **before** the `colorscheme` command above:

```
" Vim script:
autocmd ColorScheme paragon highlight CursorLine guibg=#ff69b4 ctermbg=13

-- Neovim Lua:
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "paragon",
    command = "highlight CursorLine guibg=#ff69b4 ctermbg=13",
})
```

It may be possible that some highlights objectively suck (especially in light
mode, as I don't use it much), or that some plugins you use are missing
highlights with this theme (as I personally don't use many plugins); feel free
to throw me a pull request to improve any such issues!

## What's with the name?

Unlike paramount, the name has no deep meaning. The name was chosen because it
sounds cool and it begins with the letter "p" like paramount does...

However [@3N4N](https://github.com/3N4N) came up with a great alternative
interpretation of the name:

> Well paragon means people with high virtue.
> It's similar, like, in a metaphorical sense. :)

So I'll roll with that. 😇
