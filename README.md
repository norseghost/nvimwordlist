# nvimwordlist

Neovim spell checking is great; more so with it being treesitter aware.
However, doing Neovim configuration, there can be a lot of commands and options in strings that get flagged as bad words.
This plugin tries to alleviate that.

## Installation

Using Packer:

```lua
use {
    "norseghost/nvimwordlist",
    run = "NvimWordlistUpdate",
    config = function()
        vim.opt.spelllang:append("vim")
    end
}
```

## How it works

Generates a vim spelling file for vim commands and options; to aid in plugin development and configuration.
The word list is made from (ab)using the `vim.fn.getcompletions()` function, and will thus find commands from plugins as well as the Neovim builtin.

## To Do

- [x] short option names
- [ ] option values
- [ ] configurable subsets for the list
- [ ] automatically set up spelllang for `.lua`, `.vim`, `.md` filetypes?
- [ ] (eventually) vim documentation
