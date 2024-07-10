return {
  'zbirenbaum/copilot.lua',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {
      suggestion = { enabled = false, auto_trigger = true },
      panel = { enabled = false },
      filetypes = {
        cpp = function()
          if vim.fn.getcwd():match '/cp$' then
            return false
          end
          return true
        end,
      },
    }
    -- Toggle copilot
    vim.api.nvim_set_keymap('n', '<leader>cd', ':Copilot toggle<CR>:Copilot status<CR>', { noremap = true, silent = false })
  end,
}
