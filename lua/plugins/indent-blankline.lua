if true then
  return {}
end

return {
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      -- Highlight set in colorscheme (nightfox) cause it overrides values set here
      -- vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { fg = "#71839b" })
      -- vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = "green" })

      require("indent_blankline").setup {
        -- for example, context is off by default, use this to turn it on
        -- char = "│",
        show_current_context = false,
        show_current_context_start = false,
        show_end_of_line = true,
        char_blankline = '┆'
      }
    end
  },
}
