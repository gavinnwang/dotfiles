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
