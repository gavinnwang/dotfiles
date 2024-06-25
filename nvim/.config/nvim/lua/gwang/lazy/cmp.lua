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
  Copilot = '  ',
}
local function border(hl_name)
  return {
    { '╭', hl_name },
    { '─', hl_name },
    { '╮', hl_name },
    { '│', hl_name },
    { '╯', hl_name },
    { '─', hl_name },
    { '╰', hl_name },
    { '│', hl_name },
  }
end

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
          vim_item.kind = string.format('   %s %s', kind_icons[vim_item.kind], vim_item.kind)
          return vim_item
        end,
      },

      window = {
        completion = {
          side_padding = 0,
          scrollbar = false,
          border = border 'CmpBorder',
        },
        documentation = {
          border = border 'CmpDocBorder',
          winhighlight = 'Normal:CmpDoc',
          scrollbar = false,
        },
      },
      completion = { completeopt = 'menu,menuone,noinsert' },
      mapping = cmp.mapping.preset.insert {
        ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<C-Space>'] = cmp.mapping.complete {},
      },

      sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'copilot' },
      },
    }
  end,
}
