return {
  'zbirenbaum/copilot.lua',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {
      suggestion = { enabled = false, auto_trigger = true },
      panel = { enabled = false },
    }
    -- Toggle copilot
    vim.api.nvim_set_keymap('n', '<leader>cd', ':Copilot toggle<CR>:Copilot status<CR>', { noremap = true, silent = false })
  end,
}
