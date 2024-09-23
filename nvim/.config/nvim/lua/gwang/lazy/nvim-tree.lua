return {
  'nvim-tree/nvim-tree.lua',
  event = 'BufWinEnter',
  cmd = { 'NvimTreeToggle', 'NvimTreeClose' },
  opts = {
    on_attach = function(bufnr)
      require('nvim-tree.api').config.mappings.default_on_attach(bufnr)
      -- don't trigger m and ctrl t
      -- m is used for moving up and ctrl t is for toggling term
      local api = require 'nvim-tree.api'
      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end
      api.config.mappings.default_on_attach(bufnr)
      vim.keymap.set('n', 'b', api.marks.toggle, opts 'Toggle Bookmark')
      vim.keymap.set('n', '?', api.tree.toggle_help, opts 'Help')
      vim.keymap.set('n', 'p', api.marks.bulk.move, opts 'Move Bookmark')
      vim.keymap.del('n', '<C-t>', { buffer = bufnr })
      vim.keymap.del('n', 'm', { buffer = bufnr })
    end,
    filters = {
      dotfiles = false,
      custom = { '.git' },
    },
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = false,
    sync_root_with_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = false,
    },
    view = {
      adaptive_size = false,
      side = 'right',
      width = 40,
      preserve_window_proportions = true,
    },
    git = {
      enable = true,
      ignore = false,
    },
    filesystem_watchers = {
      enable = true,
    },
    actions = {
      open_file = {
        resize_window = true,
      },
    },
    renderer = {
      root_folder_label = false,
      highlight_git = true,
      highlight_opened_files = 'none',

      indent_markers = {
        enable = false,
      },

      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
        },
        glyphs = {
          default = '󰈚',
          symlink = '',
          folder = {
            default = '',
            empty = '',
            empty_open = '',
            open = '',
            symlink = '',
            symlink_open = '',
            arrow_open = '',
            arrow_closed = '',
          },
          git = {
            unstaged = '✗',
            staged = '✓',
            unmerged = '',
            renamed = '➜',
            untracked = '★',
            deleted = '',
            ignored = '◌',
          },
        },
      },
    },
  },
  config = function(_, opts)
    vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', { desc = 'nvimtree toggle window' })
    require('nvim-tree').setup(opts)
  end,
}
