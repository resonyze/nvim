-- if true then
--   return {}
-- end
--
return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      update_focused_file = {
        enable = true,
        update_root = false,
        ignore_list = {},
      },
      view = {
        preserve_window_proportions = true,
      },
      actions = {
        open_file = {
          resize_window = false,
        },
      },
    })
    vim.keymap.set('n', '<C-n>', require("nvim-tree.api").tree.toggle,
      { desc = "Toggle nvim-tree" })
  end,
}
