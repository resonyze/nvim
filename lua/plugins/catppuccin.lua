return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function ()
        require("catppuccin").setup({
            transparent_background = false,
            color_overrides = {
                macchiato = {
                    text = "#c5c8c6",
                },
            },
        })
        -- vim.cmd.colorscheme("catppuccin-macchiato")
    end,
}
