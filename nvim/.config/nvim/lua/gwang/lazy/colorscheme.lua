return {
  {
    'sainnhe/gruvbox-material',
    opts = {},
  },
  {
    'maxmx03/solarized.nvim',
    opts = {},
  },
  {
    'jesseleite/nvim-noirbuddy',
    dependencies = {
      { 'tjdevries/colorbuddy.nvim', branch = 'dev' },
    },
    opts = {
      transparent_background = false,
      gamma = 0.85,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        identifiers = { italic = false },
        functions = { italic = false },
        variables = { italic = false },
      },
      -- colors = {
      --   primary = '#93518B',
      --   secondary = '#EE579B',
      -- },
      colors = {
        secondary = '#6EE2FF',
        primary = '#267FB5',
      },
    },
  },
  {
    'folke/tokyonight.nvim',
    opts = {},
  },
  {
    'navarasu/onedark.nvim',
    opts = {},
  },
  {
    'sainnhe/sonokai',
    opts = {},
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    init = function()
      vim.o.termguicolors = true
      vim.cmd.colorscheme 'rose-pine'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}
