vim.keymap.set('n', 'n', '10jzz', { desc = 'Move cursor down 10 lines and center' })
vim.keymap.set('n', 'm', '10kzz', { desc = 'Move cursor up 10 lines and center' })
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { desc = 'Center' })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { desc = 'Center' })

-- vim.keymap.set('n', 'va', 'v$', { desc = 'Select all text from cursor to end of line' })
-- vim.keymap.set('n', 'vi', 'v0', { desc = 'Select all text from cursor to beginning of line' })
vim.keymap.set('n', 'gm', 'gM', { desc = 'Move to the middle of the screen' })

-- Easier navigation for wrapped lines
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- clear search highlights on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- vim.keymap.set('n', '<C-x>', '<C-w>j :q <CR> <C-w>l', { desc = 'Close bottom tab' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Keybinds to make split navigation easier.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_set_keymap('n', '<C-q>', ':wa<CR>:NvimTreeClose<CR>:qa<CR>', { noremap = true, silent = true })
