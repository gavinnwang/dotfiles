return {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  { 'numToStr/Comment.nvim', opts = {} },
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    init = function()
      vim.o.termguicolors = true
      vim.cmd.colorscheme 'tokyonight-night'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}
