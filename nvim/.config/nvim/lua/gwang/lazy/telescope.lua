return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  lazy = true,
  -- event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  cmd = { 'Telescope' },
  config = function()
    local actions = require 'telescope.actions'
    local function find_command()
      if 1 == vim.fn.executable 'rg' then
        return { 'rg', '--files', '--color', 'never', '-g', '!.git' }
      elseif 1 == vim.fn.executable 'fd' then
        return { 'fd', '--type', 'f', '--color', 'never', '-E', '.git' }
      elseif 1 == vim.fn.executable 'fdfind' then
        return { 'fdfind', '--type', 'f', '--color', 'never', '-E', '.git' }
      elseif 1 == vim.fn.executable 'find' and vim.fn.has 'win32' == 0 then
        return { 'find', '.', '-type', 'f' }
      elseif 1 == vim.fn.executable 'where' then
        return { 'where', '/r', '.', '*' }
      end
    end
    require('telescope').setup {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
      defaults = {
        path_display = { 'smart' },
        file_ignore_patterns = { '.git/', 'node_modules', 'build/' },
        vimgrep_arguments = {
          'rg',
          '-L',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
        },
        selection_caret = '  ',
        sorting_strategy = 'ascending',
        layout_strategy = 'horizontal',
        entry_prefix = '  ',
        mappings = {
          i = {
            ['<C-q>'] = actions.send_to_qflist,
            ['<C-a>'] = actions.send_selected_to_qflist,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
          },
          n = {
            ['<C-q>'] = actions.send_to_qflist,
            ['<C-a>'] = actions.send_selected_to_qflist,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
            ['q'] = actions.close,
          },
        },
        layout_config = {
          horizontal = {
            prompt_position = 'top',
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        color_devicons = true,
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = '[F]ind [F]iles' })
    vim.keymap.set('n', '<leader>w', builtin.live_grep, { desc = '[F]ind [W]ord' })
    vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = '[F]ind [B]uffers' })
    vim.keymap.set('n', '<leader>s', builtin.current_buffer_fuzzy_find, { desc = '[S]earch [F]uzzy' })
    vim.keymap.set('n', '<leader>th', ':Telescope colorscheme<CR>', { desc = 'Theme Switcher' })
    vim.keymap.set('n', '<leader>gc', ':Telescope git_commits<CR>', { desc = 'Git Commits' })
    vim.keymap.set('n', '<leader>gs', ':Telescope git_status<CR>', { desc = 'Git Status' })
  end,
}
