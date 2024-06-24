return {
  'folke/trouble.nvim',
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = 'Trouble',
  keys = {
    {
      '<leader>e',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    -- {
    --   '<leader>q',
    --   '<cmd>Trouble qflist toggle<cr>',
    --   desc = 'Quickfix List (Trouble)',
    -- },
    -- {
    --   '<leader>xX',
    --   '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
    --   desc = 'Buffer Diagnostics (Trouble)',
    -- },
    {
      '<leader>cs',
      '<cmd>Trouble symbols toggle focus=false<cr>',
      desc = 'Symbols (Trouble)',
    },
  },
}