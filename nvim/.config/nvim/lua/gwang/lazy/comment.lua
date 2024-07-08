return {
  event = 'VeryLazy',
  'numToStr/Comment.nvim',
  opts = {},
  config = function()
    local api = require 'Comment.api'
    vim.keymap.set('n', '<leader>/', function()
      api.toggle.linewise.current()
    end, { desc = 'comment toggle' })
    vim.keymap.set('x', '<leader>/', '<Plug>(comment_toggle_linewise_visual)')
  end,
}
