return {
  "EdenEast/nightfox.nvim",
  config = function()
    -- require('nightfox').setup({
    --   options = {
    --     colorblind = {
    --       enable = false,
    --       severity = {
    --         tritan = 0.1,
    --       },
    --     }
    --   }
    -- })
    vim.cmd.colorscheme("nightfox")
  end
}
