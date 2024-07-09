return {
  'Wansmer/treesj',
  event = 'VeryLazy',
  keys = { '<space>m' },
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('treesj').setup {}
  end,
}
