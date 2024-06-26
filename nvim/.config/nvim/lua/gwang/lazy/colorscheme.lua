-- return {
--   'sainnhe/sonokai',
--   priority = 1000,
--   config = function()
--     vim.o.termguicolors = true
--     vim.cmd.colorscheme 'sonokai'
--     vim.cmd 'hi Comment gui=none'
--   end,
-- }

--[[ return {
  'navarasu/onedark.nvim',
  priority = 1000,
  config = function()
    require('onedark').setup {
      style = 'darker',
    }
    require('onedark').load()
    vim.o.termguicolors = true
    vim.cmd.colorscheme 'onedark'
    vim.cmd 'hi Comment gui=none'
  end,
} ]]

--[[ return {
  'rose-pine/neovim',
  name = 'rose-pine',
  priority = 1000,
  init = function()
    vim.o.termguicolors = true
    vim.cmd.colorscheme 'rose-pine'
    vim.cmd.hi 'Comment gui=none'
  end,
} ]]

-- return {
--   'folke/tokyonight.nvim',
--   priority = 1000,
--   init = function()
--     vim.o.termguicolors = true
--     vim.cmd.colorscheme 'tokyonight-night'
--     vim.cmd.hi 'Comment gui=none'
--   end,
-- }

--[[ M = {
  'notken12/base46-colors',
  name = 'base46',
  priority = 1000,
  lazy = false,
  config = function()
    local status_ok, _ = pcall(vim.cmd.colorscheme, 'everblush')
    if not status_ok then
      return
    end
  end,
} ]]

return {
  {
    -- "folke/tokyonight.nvim",
    -- "AlphaTechnolog/pywal.nvim",
    -- "rockerBOO/boo-colorscheme-nvim",
    'jesseleite/nvim-noirbuddy',
    -- "tiagovla/tokyodark.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    dependencies = {
      {
        'rktjmp/lush.nvim',
      },
      { 'tjdevries/colorbuddy.nvim', branch = 'dev' },
    },
    opts = {
      -- transparent_background = false,
      -- gamma = 0.85,
      -- styles = {
      --   comments = { italic = false },
      --   keywords = { italic = false },
      --   identifiers = { italic = false },
      --   functions = { italic = false },
      --   variables = { italic = false }
      -- }
      colors = {
        primary = '#E4579B',
        secondary = '#93518B',
      },
    },
    config = function(_, opts)
      require('noirbuddy').setup(opts)
      -- require('noirbuddy').setup {
      --   colors = {
      --     primary = '#6EE2FF',
      --     secondary = '#267FB5',
      --   },
      -- }
    end,
  },
}
