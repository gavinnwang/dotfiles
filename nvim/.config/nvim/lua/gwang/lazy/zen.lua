return {
  event = 'VeryLazy',
  'folke/zen-mode.nvim',
  opts = {
    plugins = {
      gitsigns = { enabled = true }, -- disables git signs
      tmux = { enabled = true }, -- disables the tmux statusline
    },
  },
}
