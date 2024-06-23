return {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  { 'numToStr/Comment.nvim', opts = {} },
  {
    'ray-x/lsp_signature.nvim',
    event = 'VeryLazy',
    opts = {},
  },
}
