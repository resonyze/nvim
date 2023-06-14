return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'folke/neodev.nvim', opts = {} },
    { 'hrsh7th/cmp-nvim-lsp' },
  },
  config = function()
    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        }
      }
    })
  end
}
