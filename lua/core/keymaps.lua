-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- <leader>-s to save
-- vim.keymap.set({ 'n', 'i' }, '<C-s>', vim.cmd.write, { desc = "<C-s> to write/save file" })

-- H,L to switch tabs in normal mode
vim.keymap.set('n', 'H', vim.cmd.tabp, { desc = 'Switch to previous tab' })
vim.keymap.set('n', 'L', vim.cmd.tabn, { desc = 'Switch to next tab' })

-- C-c to copy to system clipboard
vim.keymap.set('v', '<C-c>', '"+y')

vim.keymap.set('n', '<leader>cd', function()
  local cwd = vim.fn.expand('%:p:h')
  vim.fn.setreg('+', cwd)
  print("Copied " .. cwd .. " to clipboard")
end, { desc = "Copy the directory containing file" })

vim.keymap.set('n', '<leader>cc', function()
  vim.cmd(":w")
  vim.cmd("so " .. vim.fn.expand('%:p'))
end, { desc = "Source the current file" })

vim.keymap.set('n', '<C-b>', function()
  vim.cmd("TSPlaygroundToggle")
end, { desc = "Toggle treesitter playground" })

vim.keymap.set({ 'n', 'i' }, '<C-l>', function()
  vim.cmd("vertical resize +1")
end, { desc = "Vertical increase by size 10" })

vim.keymap.set({ 'n', 'i' }, '<C-h>', function()
  vim.cmd("vertical resize -1")
end, { desc = "Vertical decrease by size 10" })

vim.keymap.set({ 'n' }, '<C-k>', function()
  vim.cmd("resize +1")
end, { desc = "Horizontal increase by size 10" })

vim.keymap.set({ 'n'  }, '<C-j>', function()
  vim.cmd("resize -1")
end, { desc = "Horizontal decrease by size 10" })

-- vim.keymap.set({ 'n' }, '<M-l>', function()
--   vim.cmd("wincmd l")
-- end, { desc = "Go to window in l direction" })
--
-- vim.keymap.set({ 'n' }, '<M-h>', function()
--   vim.cmd("wincmd h")
-- end, { desc = "Go to window in h direction" })
--
-- vim.keymap.set({ 'n' }, '<M-k>', function()
--   vim.cmd("wincmd k")
-- end, { desc = "Go to window in k direction" })
--
-- vim.keymap.set({ 'n' }, '<M-j>', function()
--   vim.cmd("wincmd j")
-- end, { desc = "Go to window in j direction" })


local appendCharToEnd = function ()
  local inputchar = vim.fn.nr2char(vim.fn.getchar())
  vim.api.nvim_feedkeys(
    vim.api.nvim_replace_termcodes('<Esc>mmA' .. inputchar .. '<Esc>`ma', true, false, true),
    'n',
    true
  )
end
vim.keymap.set({'n', 'i', 's'}, '<C-e>', appendCharToEnd)

-- vim.keymap.set('i', '<C-e>', '<Esc>A', { desc = "Go to end of line" })
