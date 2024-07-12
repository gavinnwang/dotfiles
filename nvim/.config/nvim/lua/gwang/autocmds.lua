-- Function to open specific files if in a directory named 'cp'
-- Otherwise, open the first file with specified extensions and then open nvim-tree
local function open_files_and_nvim_tree()
  local did_edit = false
  local extensions = { '%.cpp$', '%.py$', '%.cc$', '%.c$', '%.lua$' }

  if vim.fn.getcwd():match '/cp$' then
    vim.cmd 'edit a.txt'
    vim.cmd 'edit a.cpp'
  elseif vim.fn.getcwd():match '/gc$' then
    vim.cmd 'edit serialize.h'
    vim.cmd 'edit serialize.c'
  elseif vim.fn.getcwd():match '/gwang$' then
    vim.cmd 'Telescope find_files'
  elseif vim.fn.argc() == 0 then
    local files = vim.fn.glob('*', false, true)
    for _, file in ipairs(files) do
      for _, ext in ipairs(extensions) do
        if file:match(ext) then
          vim.cmd('edit ' .. file)
          did_edit = true
          break
        end
      end
      if did_edit then
        break
      end
    end
    require('nvim-tree.api').tree.open()
    if did_edit then
      vim.cmd 'wincmd h' -- Move the cursor to the left buffer (Nvim Tree)
    end
  end
end

-- Autocommand to call the function after Neovim has fully initialized
vim.api.nvim_create_autocmd('VimEnter', {
  pattern = '*',
  callback = function()
    vim.schedule(open_files_and_nvim_tree)
  end,
})
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
