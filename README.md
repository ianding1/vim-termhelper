# TermHelper

**The last piece of the Vim-Terminal jigsaw.**

![Banner][banner]

TermHelper allows the user to open a file in a Vim buffer from a embedded
terminal.

This plugin **doesn't support Neovim** due to Neovim lacking the mechanism to
send messages back to Vim from embedded terminals.

## Installation

1. Install the plugin:
```vim
Plug 'ianding1/vim-termhelper'
```
2. Add this line to *~/.bashrc* or *~/.zshrc*:
```bash
[[ -n "$TERMHELPER_SCRIPTS_DIR" ]] && source
"$TERMHELPER_SCRIPTS_DIR/setup_termhelper.sh"
```

## Terminal Commands

```bash
other <file>
```

Open the file in the other window in Vim if there are only two windows, one the
terminal and the other some other file being edit.

```bash
drop <file>
```

Open the file in Vim. If the file is already opened, go to the window that
opened the file. See `:h drop`.

```bash
new <file>
```

Open the file in a new horizontally-split window in Vim. See `:h new`.

```bash
vnew <file>
```

Open the file in a new vertically-split window in Vim. See `:h vnew`.

```bash
prv <file>
```

Open the file in the preview window in Vim.

## Configuration

```bash
# Set to 1 not to define the predefined aliases.
export TERMHELPER_NO_ALIAS=0
```

[banner]: https://i.imgur.com/0y1ixeC.png
