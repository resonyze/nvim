local bufno = 3
local winid = 1192
--
local pos = vim.api.nvim_win_get_cursor(1192)
-- P(pos)

local line = vim.api.nvim_buf_get_lines(3, pos[1] - 1, pos[1], true)[1]
local last_char_index = #line
local last_char = string.sub(line, last_char_index, last_char_index)

-- P{
--   last_char = last_char
-- }

local last_char_pos = {
  x = pos[1],
  y = last_char_index - 1
}

P(last_char_pos)
