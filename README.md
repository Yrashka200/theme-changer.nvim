# theme-changer.nvim

A small Neovim plugin for browsing and switching between popular colorschemes
with the `:theme` command.

## Features

- Opens a searchable colorscheme picker with `:theme`.
- Shows which catalog themes are not currently installed.
- Applies an installed colorscheme immediately.
- Has no required third-party plugin dependencies.

## Requirements

- Neovim 0.8 or later.
- Optional colorscheme plugins for the themes you want to use.

The picker uses Neovim's built-in `vim.ui.select`. Install a UI plugin such as
[dressing.nvim](https://github.com/stevearc/dressing.nvim) or
[telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim)
only if you want to replace the default picker UI; neither is required.

## Installation

### lazy.nvim

Add the repository to your plugin specs:

```lua
{
  "Yrashka200/theme-changer.nvim",
  -- Optional: install one or more colorschemes from the catalog.
  dependencies = {
    "folke/tokyonight.nvim",
    "catppuccin/nvim",
  },
}
```

### packer.nvim

```lua
use {
  "Yrashka200/theme-changer.nvim",
  requires = {
    "folke/tokyonight.nvim",
    "catppuccin/nvim",
  },
}
```

### Manual installation

Clone this repository into a directory on Neovim's runtime path, for example:

```sh
git clone https://github.com/Yrashka200/theme-changer.nvim \
  ~/.local/share/nvim/site/pack/plugins/start/theme-changer.nvim
```

Restart Neovim to load the plugin.

## Using `:theme`

Run:

```vim
:theme
```

Choose an installed theme from the picker. If a theme is marked `[not
installed]`, install its colorscheme plugin with your plugin manager and restart
Neovim. Press Escape or cancel the picker to close it without changing themes.

## Colorscheme catalog

The plugin itself does not install colorschemes. Install only the themes you
want to use:

| Theme | Plugin | Colorscheme |
| --- | --- | --- |
| Tokyo Night | [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | `tokyonight-night` |
| Catppuccin Mocha | [catppuccin/nvim](https://github.com/catppuccin/nvim) | `catppuccin-mocha` |
| GitHub Dark | [projekt0n/github-nvim-theme](https://github.com/projekt0n/github-nvim-theme) | `github_dark` |
| VS Code | [Mofiqul/vscode.nvim](https://github.com/Mofiqul/vscode.nvim) | `vscode` |
| One Dark | [navarasu/onedark.nvim](https://github.com/navarasu/onedark.nvim) | `onedark` |
| Kanagawa Wave | [rebelot/kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim) | `kanagawa-wave` |
| Gruvbox | [ellisonleao/gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim) | `gruvbox` |
| Nord | [shaunsingh/nord.nvim](https://github.com/shaunsingh/nord.nvim) | `nord` |
| Everforest | [sainnhe/everforest](https://github.com/sainnhe/everforest) | `everforest` |
| Rose Pine | [rose-pine/neovim](https://github.com/rose-pine/neovim) | `rose-pine` |
| Dracula | [Mofiqul/dracula.nvim](https://github.com/Mofiqul/dracula.nvim) | `dracula` |
| Nightfox | [EdenEast/nightfox.nvim](https://github.com/EdenEast/nightfox.nvim) | `nightfox` |

## Configuration

The catalog is defined in `lua/theme_changer.lua`. Add an entry with a display
name and the colorscheme name provided by its theme plugin:

```lua
{ name = "My Theme", colorscheme = "my-theme" },
```

The colorscheme plugin must also be installed separately. Restart Neovim after
editing the catalog.

