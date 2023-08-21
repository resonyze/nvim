-- Create the on_attach function
local apply_keymaps = function(client, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  if client.name == "dartls" then
    nmap('<leader>f', vim.lsp.buf.format, '[F]ormat file')
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  -- nmap('gd', function ()
  nmap('gd', function()
    local curwin = vim.api.nvim_get_current_win()
    local height = vim.api.nvim_win_get_height(curwin) * 5
    local width = vim.api.nvim_win_get_width(curwin) * 2

    if height > width then
      vim.cmd("split")
    else
      vim.cmd("vsplit")
    end

    vim.lsp.buf.definition()
  end, '[G]oto [D]efinition')

  -- nmap('gsd', function()
  --   vim.cmd("split")
  --   vim.lsp.buf.definition()
  -- end, '[G]oto [D]efinition')

  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Autocommand exected following LspAttach event
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    print("Client " .. client.name .. " attached")

    -- This applies the keymaps
    apply_keymaps(client, bufnr)

    -- require "lsp_signature".on_attach({
    --   bind = true,
    --   transparency = 100,
    --   hint_prefix = "🌇 ",
    --   toggle_key = "<C-k>"
    -- }, bufnr)
    -- require('sig-window-nvim').on_attach(client, bufnr, {})
    --   -- This creates an autocommand for save
    --   vim.api.nvim_create_autocmd("BufWritePre", { callback = function (_)
    --     vim.lsp.buf.format()
    --   end})
  end,
})
