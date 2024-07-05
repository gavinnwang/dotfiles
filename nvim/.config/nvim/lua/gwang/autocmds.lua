vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('SwapExists', {
  callback = function()
    vim.v.swapchoice = 'e'
    vim.cmd 'echomsg "Concurrent editing"'
  end,
})

-- auto close
local function is_modified_buffer_open(buffers)
  for _, v in pairs(buffers) do
    if v.name:match 'NvimTree_' == nil then
      return true
    end
  end
  return false
end

vim.api.nvim_create_autocmd('BufEnter', {
  nested = true,
  callback = function()
    if
      #vim.api.nvim_list_wins() == 1
      and vim.api.nvim_buf_get_name(0):match 'NvimTree_' ~= nil
      and is_modified_buffer_open(vim.fn.getbufinfo { bufmodified = 1 }) == false
    then
      vim.cmd 'quit'
    end
  end,
})

vim.api.nvim_create_autocmd('BufEnter', {
  desc = 'Disable automatic comment insertion',
  group = vim.api.nvim_create_augroup('AutoComment', {}),
  callback = function()
    vim.opt_local.formatoptions:remove { 'c', 'r', 'o' }
  end,
})

-- Function to open the first file in the directory and then open nvim-tree
local function open_first_file_and_nvim_tree()
  if vim.fn.argc() == 0 then
    local first_file = vim.fn.glob('*', false, true)[1]
    if first_file ~= nil then
      vim.cmd('edit ' .. first_file)
    end
  end
  require('nvim-tree.api').tree.open()
  vim.cmd 'wincmd h' -- Move the cursor to the left buffer (Nvim Tree)
end

-- Autocommand to call the function after Neovim has fully initialized
vim.api.nvim_create_autocmd('VimEnter', {
  pattern = '*',
  callback = function()
    vim.schedule(open_first_file_and_nvim_tree)
  end,
})
