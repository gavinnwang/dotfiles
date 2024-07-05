local kind_icons = {
  Text = '  ',
  Method = '  ',
  Function = '  ',
  Constructor = '  ',
  Field = '  ',
  Variable = '  ',
  Class = '  ',
  Interface = '  ',
  Module = '  ',
  Property = '  ',
  Unit = '  ',
  Value = '  ',
  Enum = '  ',
  Keyword = '  ',
  Snippet = '  ',
  Color = '  ',
  File = '  ',
  Reference = '  ',
  Folder = '  ',
  EnumMember = '  ',
  Constant = '  ',
  Struct = '  ',
  Event = '  ',
  Operator = '  ',
  TypeParameter = '  ',
  Copilot = '  ',
}
-- local function border(hl_name)
--   return {
--     { '╭', hl_name },
--     { '─', hl_name },
--     { '╮', hl_name },
--     { '│', hl_name },
--     { '╯', hl_name },
--     { '─', hl_name },
--     { '╰', hl_name },
--     { '│', hl_name },
--   }
-- end

return { -- Autocompletion
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    {
      'zbirenbaum/copilot-cmp',
      config = function()
        require('copilot_cmp').setup()
      end,
    },
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
  },
  config = function()
    local cmp = require 'cmp'
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' },
      },
    })

    cmp.setup {
      formatting = {
        fields = { 'abbr', 'kind', 'menu' },
        expandable_indicator = true,
        format = function(_, vim_item)
          vim_item.kind = string.format(' %s %s', kind_icons[vim_item.kind], vim_item.kind)
          vim_item.abbr = string.sub(vim_item.abbr, 1, 20)
          vim_item.menu = string.sub(vim_item.menu or '', 1, 10)
          return vim_item
        end,
      },
      performance = {
        debounce = 60,
        throttle = 30,
        fetching_timeout = 200,
        confirm_resolve_timeout = 80,
        async_budget = 1,
        max_view_entries = 5,
      },
      window = {
        completion = {
          side_padding = 0,
          scrollbar = false,
          -- border = border 'CmpBorder',
        },
        documentation = {
          side_padding = 0,
          scrollbar = false,
          winhighlight = 'Normal:CmpDoc',
          -- border = border 'CmpDocBorder',
        },
      },
      completion = { completeopt = 'menu,menuone,noinsert', keyword_length = 2 },
      mapping = cmp.mapping.preset.insert {
        ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.complete(),
      },

      sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'copilot' },
      },
    }
  end,
}
