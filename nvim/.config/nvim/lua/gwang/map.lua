local function set_keymap(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
end

-- Example usage of the helper function
set_keymap('n', 'n', '10jzz', 'Move cursor down 10 lines and center')
set_keymap('n', 'm', '10kzz', 'Move cursor up 10 lines and center')
set_keymap('n', '<C-d>', '<C-d>zz', 'Center')
set_keymap('n', '<C-u>', '<C-u>zz', 'Center')

-- Additional mappings
set_keymap('n', 'gm', 'gM', 'Move to the middle of the screen')

-- Easier navigation for wrapped lines
set_keymap('n', 'j', 'gj', nil)
set_keymap('n', 'k', 'gk', nil)

-- Clear search highlights on pressing <Esc> in normal mode
set_keymap('n', '<Esc>', '<cmd>nohlsearch<CR>', nil)

-- Diagnostic keymaps
set_keymap('n', '[d', vim.diagnostic.goto_prev, 'Go to previous [D]iagnostic message')
set_keymap('n', ']d', vim.diagnostic.goto_next, 'Go to next [D]iagnostic message')
set_keymap('n', '<leader>q', vim.diagnostic.setloclist, 'Open diagnostic [Q]uickfix list')

-- Keybinds to make split navigation easier
set_keymap('n', '<C-h>', '<C-w><C-h>', 'Move focus to the left window')
set_keymap('n', '<C-l>', '<C-w><C-l>', 'Move focus to the right window')
set_keymap('n', '<C-j>', '<C-w><C-j>', 'Move focus to the lower window')
set_keymap('n', '<C-k>', '<C-w><C-k>', 'Move focus to the upper window')

-- Quick exit when you don't care too much
set_keymap('n', '<C-q>', ':wa<CR>:NvimTreeClose<CR>:qa<CR>', 'Save and quit')
