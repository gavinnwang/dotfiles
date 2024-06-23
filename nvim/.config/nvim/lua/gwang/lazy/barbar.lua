local M = {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  event = 'BufEnter *.*',
  vim.keymap.set('n', '<Tab>', '<Cmd>BufferNext<CR>'),
  vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>'),
  vim.keymap.set('n', '<leader>x', '<Cmd>BufferClose<CR>'),
  config = function()
    require('barbar').setup {
      animation = false,
      clickable = false,
      focus_on_close = 'previous',
    }
  end,
}
return M
