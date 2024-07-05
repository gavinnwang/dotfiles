local M = {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  event = 'BufEnter *.*',
  config = function()
    require('barbar').setup {
      animation = true,
      clickable = true,
      focus_on_close = 'previous',
      auto_hide = 2,
    }

    -- Key mappings
    vim.keymap.set('n', '<Tab>', '<Cmd>BufferNext<CR>')
    vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>')
    vim.keymap.set('n', '<leader>x', '<Cmd>BufferClose<CR>')
    vim.keymap.set('n', '<leader>z', '<Cmd>BufferCloseAllButCurrent<CR>')

    -- Buffer go-to mappings
    vim.keymap.set('n', '<leader>1', '<Cmd>BufferGoto 1<CR>', { silent = true })
    vim.keymap.set('n', '<leader>2', '<Cmd>BufferGoto 2<CR>', { silent = true })
    vim.keymap.set('n', '<leader>3', '<Cmd>BufferGoto 3<CR>', { silent = true })
    vim.keymap.set('n', '<leader>4', '<Cmd>BufferGoto 4<CR>', { silent = true })
  end,
}

return M
