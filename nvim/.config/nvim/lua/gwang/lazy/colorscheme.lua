return {
  'sainnhe/sonokai',
  priority = 1000,
  config = function()
    vim.o.termguicolors = true
    vim.cmd.colorscheme 'sonokai'
    vim.cmd 'hi Comment gui=none'
  end,
}

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

--[[ return {
  'folke/tokyonight.nvim',
  priority = 1000,
  init = function()
    vim.o.termguicolors = true
    vim.cmd.colorscheme 'tokyonight-night'
    vim.cmd.hi 'Comment gui=none'
  end,
} ]]

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
