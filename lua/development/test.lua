local curwinid = vim.api.nvim_get_current_win()

-- we use bufwinnr because we want to make sure there is a buffer that is attached to the window 
local bufwinnr = vim.fn.bufwinnr('_hello')

if bufwinnr < 0 then
  vim.cmd('vnew _hello')
end

local bufno = vim.fn.bufnr('_hello')

vim.api.nvim_buf_set_lines(bufno, 0, -1, true, {
  "Hello there",
  })

vim.api.nvim_set_current_win(curwinid)


-- vim.api.nvim_win_set_cursor(curwinid, cursorpos)

-- local appendToEnd = function()
--   local appendChar = vim.fn.nr2char(vim.fn.getchar())
--
--   if appendChar == nil then
--     return
--   end
--
--   local keystring = '<Esc>ma/)<CR>a' .. appendChar .. '<Esc>`aa'
--   keystring = vim.api.nvim_replace_termcodes(keystring, true, false, true)
--
--   vim.api.nvim_feedkeys(keystring, 'n', true)
-- end
--
-- vim.keymap.set({ 'i', 's' }, '<C-e>', appendToEnd, { desc = "appendToEnd" })
