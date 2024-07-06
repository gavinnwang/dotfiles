function ToggleDiagnostics()
  local diagnostics = vim.diagnostic.get(0)
  if vim.tbl_isempty(diagnostics) then
    vim.cmd 'echomsg "No Diagnostic found"'
  else
    vim.cmd 'Trouble diagnostics toggle'
  end
end

function ToggleQuickfix()
  local quickfix = vim.fn.getqflist()
  if vim.tbl_isempty(quickfix) then
    vim.cmd 'echomsg "No Quickfix items found"'
  else
    vim.cmd 'Trouble qflist toggle'
  end
end

local util = require 'vim.lsp.util'
local ms = vim.lsp.protocol.Methods
function document_symbol(callback, _)
  local params = { textDocument = util.make_text_document_params() }
  vim.lsp.buf_request(0, ms.textDocument_documentSymbol, params, function(err, result, _, _)
    if err then
      vim.notify('Error retrieving document symbols: ' .. err.message, vim.log.levels.ERROR)
      return
    end
    callback(result)
  end)
end

function ToggleSymbols()
  document_symbol(function(result)
    if result == nil or vim.tbl_isempty(result) then
      vim.cmd 'echomsg "No Symbols found"'
    else
      vim.cmd 'Trouble symbols toggle win.position=left'
    end
  end)
end

return {
  event = 'VeryLazy',
  'folke/trouble.nvim',
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = 'Trouble',
  keys = {
    {
      '<leader>e',
      '<cmd>lua ToggleDiagnostics()<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>q',
      '<cmd>lua ToggleQuickfix()<cr>',
      desc = 'Quickfix List (Trouble)',
    },
    {
      '<leader>cs',
      '<cmd>lua ToggleSymbols()<cr>',
      desc = 'Symbols (Trouble)',
    },
  },
}
