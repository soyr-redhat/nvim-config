-- Run current Python file in a VERTICAL split on the right
vim.keymap.set("n", "<leader>r", function()
  vim.cmd("silent! write")
  -- 'vertical botright 60split' creates a 60-column terminal on the far right
  vim.cmd("vertical botright 60split | term python3 " .. vim.fn.expand("%"))
end, { desc = "Run current Python file (Vertical)" })

-- Telescope mappings (Standard)
vim.keymap.set('n', '<leader>ff', function()
  require('telescope.builtin').find_files()
end, { desc = "Fuzzy find files" })

vim.keymap.set('n', '<leader>fg', function()
  require('telescope.builtin').live_grep()
end, { desc = "Live grep" })

-- WINDOW NAVIGATION (No Ctrl, No Leader conflicts)
-- Use 's' + h/j/k/l to jump between splits
vim.keymap.set('n', 'sh', '<C-w>h', { desc = "Switch to left window" })
vim.keymap.set('n', 'sj', '<C-w>j', { desc = "Switch to bottom window" })
vim.keymap.set('n', 'sk', '<C-w>k', { desc = "Switch to top window" })
vim.keymap.set('n', 'sl', '<C-w>l', { desc = "Switch to right window" })

-- Better Escape for Terminal (No Ctrl needed)
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = "Exit terminal mode" })
-- RESIZING WINDOWS (No Ctrl required)
-- Increase/Decrease Width (Vertical Splits)
vim.keymap.set('n', 's>', '<cmd>vertical resize +5<CR>', { desc = "Increase window width" })
vim.keymap.set('n', 's<', '<cmd>vertical resize -5<CR>', { desc = "Decrease window width" })

-- Increase/Decrease Height (Horizontal Splits)
vim.keymap.set('n', 's+', '<cmd>resize +5<CR>', { desc = "Increase window height" })
vim.keymap.set('n', 's-', '<cmd>resize -5<CR>', { desc = "Decrease window height" })

-- Equalize windows (Space + =)
vim.keymap.set('n', '<leader>=', '<C-w>=', { desc = "Equalize window sizes" })
