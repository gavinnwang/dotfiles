return {
  'zbirenbaum/copilot.lua',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {
      suggestion = { enabled = true },
      panel = { enabled = true },
      layout = {
        position = 'bottom', -- | top | left | right
        ratio = 0.4,
      },
    }
    -- Toggle copilot
    vim.api.nvim_set_keymap('n', '<leader>cd', ':Copilot toggle<CR>:Copilot status<CR>', { noremap = true, silent = false })
  end,
}
