return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  ---@type Flash.Config
  opts = {
    highlight = {
      backdrop = false,
    },
    modes = {
      search = {
        -- when `true`, flash will be activated during regular search by default.
        -- You can always toggle when searching with `require("flash").toggle()`
        enabled = true,
        highlight = { backdrop = false },
        jump = { history = true, register = true, nohlsearch = true },
      },
      char = {
        enabled = false,
        highlight = { backdrop = false },
        multi_line = false,
        char_actions = function()
          return {
            [';'] = 'next',
            [','] = 'prev',
          }
        end,
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "<C-s>", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  },
}
