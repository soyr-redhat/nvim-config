return {
  -- THEME
  { 
    "sainnhe/everforest", 
    lazy = false, 
    priority = 1000, 
    config = function()
      vim.g.everforest_transparent_background = 1
      vim.g.everforest_background = 'medium'
      vim.cmd([[colorscheme everforest]])
    end 
  },

  -- TELESCOPE
  {
    'nvim-telescope/telescope.nvim',
    branch = 'master', -- Use latest for Neovim 0.11+ compatibility
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  
  --HARPOON
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup({})

      -- Add file to list
      vim.keymap.set("n", "<leader>a", function() 
        harpoon:list():add() 
        print("added to harpoon") 
      end)

      -- Toggle menu with Space + h (Replacing Ctrl-e)
      vim.keymap.set("n", "<leader>h", function() 
        harpoon.ui:toggle_quick_menu(harpoon:list()) 
      end)

      -- Quick jumps 1-4
      vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
    end
  },

  -- STATUS LINE
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = { theme = 'everforest' }
      })
    end
  },

  -- LSP & INLINE ERRORS (v0.11 Syntax)
  { 
    "neovim/nvim-lspconfig", 
    dependencies = { 
      "williamboman/mason.nvim", 
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
    }, 
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({ ensure_installed = { "pyright" } })
      
      -- v0.11+ uses vim.lsp.config instead of the old lspconfig.setup
      if vim.lsp.config then
        vim.lsp.config('pyright', {})
        vim.lsp.enable('pyright')
      else
        -- Fallback for safety
        require("lspconfig").pyright.setup({})
      end

      vim.diagnostic.config({ virtual_text = true })
    end 
  },
  
  -- THE COMPLETION ENGINE (The Popup Menu)
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(), -- Trigger menu manually
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Enter to select
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' }, -- Data from Pyright
          { name = 'buffer' },   -- Data from current file text
          { name = 'path' },     -- Data from file system paths
        })
      })
    end
  },

  -- TREESITTER
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      -- We now use the main module directly
      local status, ts = pcall(require, "nvim-treesitter.configs")
      if status then
        ts.setup({
          ensure_installed = { "lua", "python", "javascript", "bash" },
          highlight = { enable = true },
          indent = { enable = true },
        })
      end
    end
  },

  -- AUTOPAIRS
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end
  },

  -- GITSIGNS
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup()
    end
  },
}
