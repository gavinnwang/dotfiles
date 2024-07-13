return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  ---@diagnostic disable: missing-fields
  event = 'VeryLazy',
  config = function()
    require('nvim-treesitter.configs').setup {
      textobjects = {
        select = {
          enable = true,
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['a='] = { query = '@assignment.outer', desc = 'Select outer part of an assignment' },
            -- ['i='] = { query = '@assignment.inner', desc = 'Select inner part of an assignment' },
            ['=l'] = { query = '@assignment.lhs', desc = 'Select left hand side of an assignment' },
            ['=r'] = { query = '@assignment.rhs', desc = 'Select right hand side of an assignment' },

            ['aa'] = { query = '@parameter.outer', desc = 'Select outer part of a parameter/argument' },
            -- ['ia'] = { query = '@parameter.inner', desc = 'Select inner part of a parameter/argument' },

            ['ai'] = { query = '@conditional.outer', desc = 'Select outer part of a conditional' },
            ['ii'] = { query = '@conditional.inner', desc = 'Select inner part of a conditional' },

            ['al'] = { query = '@loop.outer', desc = 'Select outer part of a loop' },
            ['il'] = { query = '@loop.inner', desc = 'Select inner part of a loop' },

            ['am'] = { query = '@call.outer', desc = 'Select outer part of a function call' },
            ['im'] = { query = '@call.inner', desc = 'Select inner part of a function call' },

            ['af'] = { query = '@function.outer', desc = 'Select outer part of a method/function definition' },
            ['if'] = { query = '@function.inner', desc = 'Select inner part of a method/function definition' },

            ['ac'] = { query = '@class.outer', desc = 'Select outer part of a class' },
            ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class' },
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_previous_start = {
            ['[M'] = { query = '@call.outer', desc = 'Prev function call start' },
            ['[F'] = { query = '@function.outer', desc = 'Prev method/function def start' },
            ['[C'] = { query = '@class.outer', desc = 'Prev class start' },
          },
          goto_next_end = {
            [']m'] = { query = '@call.outer', desc = 'Next function call end' },
            [']f'] = { query = '@function.outer', desc = 'Next method/function def end' },
            [']c'] = { query = '@class.outer', desc = 'Next class end' },
          },
          goto_previous_end = {
            ['[m'] = { query = '@call.outer', desc = 'Prev function call end' },
            ['[f'] = { query = '@function.outer', desc = 'Prev method/function def end' },
            ['[c'] = { query = '@class.outer', desc = 'Prev class end' },
          },
        },
        -- swap = {
        --   enable = true,
        --   swap_next = {
        --     ['<leader>na'] = '@parameter.inner', -- swap parameters/argument with next
        --     ['<leader>n:'] = '@property.outer', -- swap object property with next
        --     ['<leader>nm'] = '@function.outer', -- swap function with next
        --   },
        --   swap_previous = {
        --     ['<leader>pa'] = '@parameter.inner', -- swap parameters/argument with prev
        --     ['<leader>p:'] = '@property.outer', -- swap object property with prev
        --     ['<leader>pm'] = '@function.outer', -- swap function with previous
        --   },
        -- },
      },
    }

    local ts_repeat_move = require 'nvim-treesitter.textobjects.repeatable_move'

    -- vim way: ; goes to the direction you were moving.
    vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move_next)
    vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_previous)

    -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
    vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr, { expr = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr, { expr = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr, { expr = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr, { expr = true })
  end,
}
