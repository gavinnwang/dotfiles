return {
  {
    'sainnhe/gruvbox-material',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {},
    init = function()
      vim.o.termguicolors = true
      vim.cmd.colorscheme 'sonokai'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  {
    'maxmx03/solarized.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {},
  },
  -- {
  --   'jesseleite/nvim-noirbuddy',
  --   dependencies = {
  --     { 'tjdevries/colorbuddy.nvim', branch = 'dev' },
  --   },
  --   opts = {
  --     transparent_background = false,
  --     gamma = 0.85,
  --     styles = {
  --       comments = { italic = false },
  --       keywords = { italic = false },
  --       identifiers = { italic = false },
  --       functions = { italic = false },
  --       variables = { italic = false },
  --     },
  --     -- colors = {
  --     --   primary = '#93518B',
  --     --   secondary = '#EE579B',
  --     -- },
  --     colors = {
  --       secondary = '#6EE2FF',
  --       primary = '#267FB5',
  --     },
  --   },
  -- },
  {
    'folke/tokyonight.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {},
  },
  {
    'navarasu/onedark.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {},
  },
  {
    'sainnhe/sonokai',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {},
  },
  {
    'rose-pine/neovim',
    event = { 'BufReadPre', 'BufNewFile' },
    name = 'rose-pine',
    priority = 1000,
  },
}
