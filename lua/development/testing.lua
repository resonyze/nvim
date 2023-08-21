-- local bufwinnr = vim.fn.bufwinnr('_output')
--
-- if bufwinnr < 0 then
--   vim.cmd('vnew _output')
-- end
--
-- local bufno = vim.fn.bufnr('_output')
-- P(bufno)

local activebuffers = vim.fn.tabpagebuflist()

local found = false
for _, bufno in ipairs(activebuffers) do
  if string.find(vim.api.nvim_buf_get_name(bufno), "_output") then
    found = true
  end
end

P(found)
