return {
  "EdenEast/nightfox.nvim",
  config = function()
    require('nightfox').setup({
      groups = {
        duskfox = {
          IndentBlanklineChar = { fg = "#353638" },
          ["@parameter"] = { style = "italic" },
        },
        nightfox = {
          IndentBlanklineContextChar = { fg = "#71839b" }
        },
      },
      options = {
        -- colorblind = {
        --   enable = true,
        --   severity = {
        --     protan = 0.1, -- Severity [0,1] for protan (red)
        --     deutan = 0, -- Severity [0,1] for deutan (green)
        --     tritan = 0.1, -- Severity [0,1] for tritan (blue)
        --   },
        -- }
      }
    })
    -- vim.cmd.colorscheme("nightfox")
  end
}
