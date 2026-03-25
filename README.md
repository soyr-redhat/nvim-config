# Neovim Configuration

A modern Neovim configuration focused on Python development with LSP support, fuzzy finding, and efficient navigation.

## Prerequisites

- Neovim 0.11.6 or higher
- Git
- Python 3 (for Pyright LSP)
- A Nerd Font (for icons in lualine and telescope)
- ripgrep (for Telescope live_grep)

## Installation

### Automated Install (Recommended)

Run the build script:
```bash
bash <(curl -s https://raw.githubusercontent.com/soyr-redhat/nvim-config/main/build.sh)
```

Or clone and run locally:
```bash
git clone https://github.com/soyr-redhat/nvim-config.git
cd nvim-config
./build.sh
```

The script will:
- Backup your existing config (if any)
- Clone the repository to `~/.config/nvim`
- Install all plugins automatically

### Manual Install

1. Clone this repository:
```bash
git clone https://github.com/soyr-redhat/nvim-config.git ~/.config/nvim
```

2. Start Neovim:
```bash
nvim
```

3. Lazy.nvim will automatically install on first launch and install all plugins.

4. After plugins install, restart Neovim.

5. Mason will automatically install Pyright LSP for Python support.

### Updating

To update plugins:
```
:Lazy sync
```

To update LSP servers:
```
:Mason
```

## Key Bindings

Leader key: `Space`

### File Navigation

| Keybind | Action |
|---------|--------|
| `<leader>ff` | Fuzzy find files (Telescope) |
| `<leader>fg` | Live grep search (Telescope) |
| `<leader>a` | Add current file to Harpoon |
| `<leader>h` | Toggle Harpoon quick menu |
| `<leader>1` | Jump to Harpoon file 1 |
| `<leader>2` | Jump to Harpoon file 2 |
| `<leader>3` | Jump to Harpoon file 3 |
| `<leader>4` | Jump to Harpoon file 4 |

### Window Management

| Keybind | Action |
|---------|--------|
| `sh` | Switch to left window |
| `sj` | Switch to bottom window |
| `sk` | Switch to top window |
| `sl` | Switch to right window |
| `s>` | Increase window width |
| `s<` | Decrease window width |
| `s+` | Increase window height |
| `s-` | Decrease window height |
| `<leader>=` | Equalize window sizes |

### Code Execution

| Keybind | Action |
|---------|--------|
| `<leader>r` | Run current Python file in vertical split |

### Terminal

| Keybind | Action |
|---------|--------|
| `<Esc>` | Exit terminal mode (when in terminal) |

### Completion (in Insert mode)

| Keybind | Action |
|---------|--------|
| `<C-Space>` | Trigger completion menu |
| `<CR>` | Confirm selection |
| `<Tab>` | Next item |
| `<S-Tab>` | Previous item |

## Plugins

### Core Functionality
- **lazy.nvim** - Plugin manager
- **plenary.nvim** - Lua utility functions

### UI
- **everforest** - Colorscheme with transparent background
- **lualine.nvim** - Status line
- **nvim-web-devicons** - File icons

### Navigation
- **telescope.nvim** - Fuzzy finder
- **harpoon** (v2) - Quick file navigation

### LSP & Completion
- **nvim-lspconfig** - LSP configuration
- **mason.nvim** - LSP server installer
- **mason-lspconfig.nvim** - Bridge between mason and lspconfig
- **nvim-cmp** - Completion engine
- **cmp-nvim-lsp** - LSP completion source
- **cmp-buffer** - Buffer completion source
- **cmp-path** - Path completion source

### Code Enhancement
- **nvim-treesitter** - Syntax highlighting
- **nvim-autopairs** - Auto-close brackets/quotes
- **gitsigns.nvim** - Git integration

## Configuration Structure

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lazy-lock.json          # Plugin version lock file
└── lua/
    ├── config/
    │   ├── settings.lua    # Vim options (line numbers, tabs, etc.)
    │   ├── lazy.lua        # Lazy.nvim bootstrap
    │   └── keymaps.lua     # Custom key bindings
    └── plugins/
        └── init.lua        # All plugin configurations
```

## Customization

### Changing Theme
Edit `lua/plugins/init.lua` and modify the everforest configuration or add a different theme plugin.

### Adding LSP Servers
Edit the `ensure_installed` table in `lua/plugins/init.lua`:
```lua
require("mason-lspconfig").setup({
  ensure_installed = { "pyright", "lua_ls", "tsserver" }
})
```

### Modifying Keybinds
Edit `lua/config/keymaps.lua` or the specific plugin configuration in `lua/plugins/init.lua`.

## Troubleshooting

### Plugins not installing
Run `:Lazy` to open the plugin manager UI and check for errors.

### LSP not working
1. Check Mason: `:Mason`
2. Verify Pyright is installed
3. Check LSP status: `:LspInfo`

### Telescope live_grep not working
Install ripgrep:
```bash
# macOS
brew install ripgrep

# Linux
sudo apt install ripgrep
```

## License

MIT
