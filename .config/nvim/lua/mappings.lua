require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "n", "10jzz")
map("n", "m", "10kzz")
map("n", "va", "v$")
map("n", "vi", "v0")
map("n", "gm", "gM")
map("n", "<C-x>", "<C-w>j :q <CR> <C-w>l")
map("n", "<C-z>", "<C-w>j A")
map("t", "<C-z>", "<C-w>k")
-- map("n", "<C-j>", "<Tab>")
-- map("n", "<C-k>", "<S-Tab>")
-- recommended mappings
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
-- moving between splits
vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
-- vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
-- vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
vim.keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous)
-- swapping buffers between windows
vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
