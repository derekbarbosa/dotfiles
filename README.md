# dbarbosa dotfiles

Welcome. This is a living repository for my dotfiles.

I use GNU Stow to manage my files (symlink farm manager). It is available on
most GNU/Linux distros.

For configuration specifications, please refer to the config files for each
"tool".

For more information on GNU Stow click
[here](https://www.gnu.org/software/stow/manual/html_node/Invoking-Stow.html)

For an indepth tutorial on Stow, visit the following link:
[here](https://venthur.de/2021-12-19-managing-dotfiles-with-stow.html)

If you would like to use my configuration, clone the repo to your $HOME, and
simply use `make all` to create said symlinks.

If you would just like to use one configuration, navigate to the root of the
repository and invoke the stow command like so:

`stow --verbose --target=/home/$USER $APP_OF_CHOICE`


## A word of caution

GNU Stow will NOT overwrite your existing configs. So please, ensure that you
are starting from a clean slate.

Furthermore, feel free to remove any unwanted languages from the LSP
configuration files in [mason](./nvim/.config/nvim/lua/dbarbosa/configs/mason.lua) and
[tree-sitter](./nvim/.config/nvim/lua/dbarbosa/configs/treesitter.lua)

## Requirements

### Required

- Neovim >= 0.8
- [rustc](https://rustup.rs/) >= 1.68 
- [tree-sitter-cli](https://tree-sitter.github.io/tree-sitter/creating-parsers)
- clang (or a suitable LLVM frontend)

### Optional

- Lua 5.1
- Python3 && pip
- Any of the languages + devtools within the LSP configuration files.