return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'folke/neodev.nvim',   opts = {} },
    { 'hrsh7th/cmp-nvim-lsp' },
  },
  config = function()
    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- Available servers and configurations
    -- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations

    -- Lua language server setup
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        }
      }
    })

    -- For React development
    lspconfig.tsserver.setup({
      capabilities = capabilities
    })
    lspconfig.html.setup({
      capabilities = capabilities
    })
    lspconfig.cssls.setup({
      capabilities = capabilities
    })
  end
}
