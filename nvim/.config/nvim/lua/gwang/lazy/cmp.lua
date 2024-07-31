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
  event = { 'InsertEnter', 'CmdlineEnter' },
  dependencies = {
    {
      'zbirenbaum/copilot-cmp',
      config = function()
        require('copilot_cmp').setup()
      end,
    },
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
  },
  config = function()
    local cmp = require 'cmp'
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' },
      },
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' },
      }, {
        { name = 'cmdline' },
        { name = 'buffer' },
      }),
    })
    cmp.setup {
      experimental = { ghost_text = true },
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
        debounce = 20, -- Reduce debounce to get more frequent updates
        throttle = 10, -- Reduce throttle to get more frequent updates
        fetching_timeout = 200,
        confirm_resolve_timeout = 80,
        async_budget = 1,
        max_view_entries = 7,
      },
      window = {
        -- completion = {
        --   -- side_padding = 0,
        --   -- col_offset = 0,
        --   scrollbar = false,
        --   border = border 'NormalFloat',
        -- },
        -- documentation = {
        --   -- side_padding = 0,
        --   scrollbar = false,
        --   winhighlight = 'Normal:CmpDoc',
        --   border = border 'NormalFloat',
        -- },
      },
      completion = { completeopt = 'menu,menuone,noinsert' },
      mapping = cmp.mapping.preset.insert {
        ['<C-y>'] = cmp.mapping.confirm { select = true },
        ['<C-h>'] = cmp.mapping.confirm { select = true },
        ['<C-j>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
        ['<C-k>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
        ['<C-l>'] = cmp.mapping.abort(),
        ['<C-n>'] = cmp.mapping.complete(),
      },
      sources = {
        { name = 'copilot', group_index = 2, priority = 1000, keyword_length = 1 },
        { name = 'nvim_lsp', group_index = 2, keyword_length = 1 },
        { name = 'path', group_index = 2, keyword_length = 2 },
        { name = 'luasnip', group_index = 2, keyword_length = 2 },
        { name = 'buffer', group_index = 2, keyword_length = 3 },
      },
    }
  end,
}
