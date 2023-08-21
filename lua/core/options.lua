-- Map leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- The representation of a tab in spaces (or more precisely, columns)
vim.o.tabstop = 8
-- >,< prepends, delete a line by adding a tab character
vim.o.shiftwidth = 2
-- When enabled uses spaces instead of tab characters
vim.o.expandtab = true
-- Fine tunes the amount of spaces inserted instead of tab
-- As a general rule, softtabstop = shiftwidth
-- softtabstop has precedence over tabstop when expand is enabled
vim.o.softtabstop = 2

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Show invisible characters like space and newline
vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↵"

vim.o.cursorline = false

vim.o.equalalways = false
