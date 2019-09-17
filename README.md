# TermHelper

**The last piece of the terminal puzzle.**

![Banner][banner]

TermHelper allows the user to open a file in a Vim buffer from an embedded
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
[[ -n "$TERMHELPER_SCRIPTS_DIR" ]] && \
  source "$TERMHELPER_SCRIPTS_DIR/setup_termhelper.sh"
```

## Terminal Commands

```bash
other <file>
```

Open the file in the other window in Vim.

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
preview <file>
```

Open the file in the preview window in Vim.

## Configuration

The configurations should be put before sourcing setup_termhelper.sh in
*~/.bashrc* or *~/.zshrc*.

```bash
export TERMHELPER_NO_ALIAS=0
```

Set to 1 not to define the aliases, such as `other`. In that case, you can still
use the full name `termhelper_CMD` to refer to them, *e.g.*, `termhelper_other`.

[banner]: https://i.imgur.com/pMSYB5W.png
