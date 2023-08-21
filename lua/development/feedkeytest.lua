local appendCharToEnd = function ()
local inputchar = vim.fn.nr2char(vim.fn.getchar())
  vim.api.nvim_feedkeys(
    vim.api.nvim_replace_termcodes('<Esc>mmA' .. inputchar .. '<Esc>`ma', true, false, true),
    'n',
    true
  )
end

vim.keymap.set({'n', 'i', 's'}, '<C-e>', appendCharToEnd)

local erase_word = function()
  local current_win = vim.api.nvim_get_current_win()
  local cursor_pos = vim.api.nvim_win_get_cursor(current_win)
  local current_row, current_col = cursor_pos[1], cursor_pos[2]

  local line = vim.api.nvim_get_current_line()

  -- P({
  --   current_row = current_row,
  --   current_col = current_col,
  -- })

  -- P(vim.api.nvim_buf_get_text(0, current_row - 1, current_col, current_row - 1, current_col + 1, {}))

  -- local current_char = vim.api.nvim_buf_get_text(0, current_row - 1, current_col, current_row - 1, current_col + 1, {})[1]
  -- P({
  --   row = cursor_pos[1],
  --   column = cursor_pos[2],
  --   current_char = current_char,
  --   is_word_char = string.match(current_char, "[A-Za-z_-]") ~= nil
  -- })

  local start_row = cursor_pos[1] - 1;
  local start_col = cursor_pos[2];
  local end_col = start_col;
  local current_char = vim.api.nvim_buf_get_text(0, start_row, start_col, start_row, start_col + 1, {})[1]

  while start_col >= 0 do
    if string.match(current_char, "[A-Za-z_-]") ~= nil then
      start_col = start_col - 1
    else
      break
    end
    current_char = vim.api.nvim_buf_get_text(0, start_row, start_col, start_row, start_col + 1, {})[1]
  end

  P({
    start_col = start_col,
  })

  --local start_col = current_col
  --while start_col > 1 and line:sub(start_col, start_col):match(word_chars) do
  --  start_col = start_col - 1
  --end

  --local end_col = current_col
  --while end_col <= #line and line:sub(end_col, end_col):match(word_chars) do
  --  end_col = end_col + 1
  --end

  --vim.api.nvim_buf_set_text(0, current_row - 1, start_col - 1, current_row - 1, end_col - 1, { '' })
end
vim.keymap.set({ 'n', 'i' }, '<M-BS>', erase_word, { desc = "Erase word under cursor" })
