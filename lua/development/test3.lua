local activeBufferlist = vim.fn.tabpagebuflist()

local bufnamelist = {}
local docbuf

for _, bufno in ipairs(activeBufferlist) do
  local name = vim.api.nvim_buf_get_name(bufno)
  if string.match(name, "_output") then
    docbuf = bufno
  end
end

if docbuf then
  P({
    docbufno = docbuf,
  })
end
