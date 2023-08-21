return {
  {
    dir = "/home/vector/development/nvim/bluloco.nvim",
    config = function()
      -- vim.cmd.colorscheme("bluloco-dark")
    end
  },
  {
    dir = "/home/vector/development/nvim/iceberg.vim",
  },
  {
    dir = "/home/vector/development/nvim/vectorspace.nvim",
  },
  {
    dir = "/home/vector/development/nvim/nord.nvim",
  },
  {
    dir = "/home/vector/development/nvim/nordic.nvim",
    config = function()
      -- vim.cmd.colorscheme("bluloco-dark")
      require("nordic").setup({
        reduced_blue = false,
      })
    end
  },
  -- {
  --   dir = "/home/vector/plugins/dwm.vim",
  -- },
  {
    dir = "/home/vector/development/nvim/vector",
    dependencies = {
      "xiyaowong/transparent.nvim",
      config = function()
        require("transparent").setup({
          groups = { -- table: default groups
            'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
            'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
            'Conditional', 'Repeat', 'Operator', 'Structure', 'NonText', 'SignColumn',
            'CursorLineNr', 'EndOfBuffer', 'LineNr', 'NvimTreeNormal',
            'LuaLineVisualC', 'LuaLineCommandC', 'LuaLineNormalC', 'LuaLineInsertC',
          },
          extra_groups = {},   -- table: additional groups that should be cleared
          exclude_groups = {}, -- table: groups you don't want to clear
        })
      end
    },
    config = function()
      vim.cmd.colorscheme("vector")
      -- vim.cmd("TransparentEnable")
    end
  },
  {
    dir = "/home/vector/plugins/tsnode-utils.nvim",
    config = function()
      local ts = require("tsnode-utils")
      vim.keymap.set({ 'n', 'i' }, '<M-BS>', ts.erase_node, { desc = "Erase node under cursor" })
      -- vim.keymap.set({ 'n', 'i' }, '<C-e>', ts.curs_to_node_end, { desc = "Cursor to end of node" })
    end
  },
  {
    dir = "/home/vector/plugins/doc-window.nvim",
    config = function()
      local dw = require("doc-window")

      vim.keymap.set({ 'n', 'i' }, '<M-i>',
        function()
          dw.display_doc({ tag = false, sig = false })
        end,
        { desc = "textDocument/hover under cursor" })

      vim.keymap.set({ 'n', 'i' }, '<M-u>',
        function()
          dw.display_doc({ tag = true, sig = false })
        end,
        { desc = "textDocument/hover of nearest tag" })

      vim.keymap.set({ 'n', 'i' }, '<M-n>',
        function()
          dw.display_doc({ tag = false, sig = true })
        end,
        { desc = "textDocument/signatureHelp under cursor" })

      vim.keymap.set({ 'i', 'n' }, '<M-k>', dw.scroll_up, { desc = "doc-window scroll up" })

      vim.keymap.set({ 'i', 'n' }, '<M-j>', dw.scroll_down, { desc = "doc-window scroll down" })
    end
  },

  -- {
  --   dir = "/home/vector/development/nvim/plugins/treesitter-unit",
  --   config = function()
  --     local ts_unit = require('treesitter-unit')
  --     ts_unit.create_mappings()
  --   end
  -- }
}
