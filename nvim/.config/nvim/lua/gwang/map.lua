local function set_keymap(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
end

-- Example usage of the helper function
set_keymap('n', 'n', '10jzz', 'Move cursor down 10 lines and center')
set_keymap('n', 'm', '10kzz', 'Move cursor up 10 lines and center')
set_keymap('o', 'n', '10jzz', 'Move cursor down 10 lines and center for visual mode')
set_keymap('o', 'm', '10kzz', 'Move cursor up 10 lines and center for visual mode')
set_keymap('x', 'n', '10jzz', 'Move cursor down 10 lines and center for visual mode')
set_keymap('x', 'm', '10kzz', 'Move cursor up 10 lines and center for visual mode')

set_keymap('n', '<C-d>', '<C-d>zz', 'Center')
set_keymap('n', '<C-u>', '<C-u>zz', 'Center')

-- Additional mappings
set_keymap('n', 'gm', 'gM', 'Move to the middle of the screen')

-- Easier navigation for wrapped lines
set_keymap('n', 'j', 'gj', 'Better j')
set_keymap('n', 'k', 'gk', 'Better k')

-- Clear search highlights on pressing <Esc> in normal mode
set_keymap('n', '<Esc>', '<cmd>nohlsearch<CR>', 'Clear search highlight')

-- Diagnostic keymaps
set_keymap('n', '[d', vim.diagnostic.goto_prev, 'Go to previous [D]iagnostic message')
set_keymap('n', ']d', vim.diagnostic.goto_next, 'Go to next [D]iagnostic message')

set_keymap('n', ']q', '<cmd>cnext<CR>zz', 'Next quickfix item')
set_keymap('n', '[q', '<cmd>cprev<CR>zz', 'Previous quickfix item')

set_keymap('n', '}', 'n', 'Next search item')
set_keymap('n', '{', 'N', 'Previous search item')

-- Quick exit when you don't care too much
set_keymap('n', '<C-q>', ':wa<CR>:NvimTreeClose<CR>:qa<CR>', 'Save and quit')
