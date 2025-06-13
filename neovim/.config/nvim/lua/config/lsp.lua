local lsp = require('lsp-zero').preset({})


lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- Install these servers
lsp.ensure_installed({
  'ts_ls',
  'eslint',
  'ruby_lsp',
  'rubocop',
  'cssls',
  'volar',
  'stylelint_lsp',
  'lua_ls'
})

-- Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- Ruby LSP configuration
require('lspconfig').ruby_lsp.setup({
  init_options = {
    enabledFeatures = {
      definition = true,
      diagnostics = false,
      documentHighlights = false,
      documentSymbols = false,
      formatting = true,
      hover = true,
    },
  },
})




local mason_registry = require('mason-registry')
local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server'

-- Vue + TypeScript configuration
require'lspconfig'.ts_ls.setup {
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = vue_language_server_path,
        languages = { 'vue' },
      },
    },
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
}

require('lspconfig').volar.setup({
  on_attach = function(client, bufnr)
    -- Disable Volar's formatting, using eslint only for vue files
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
})

-- CSS Language Server
require('lspconfig').cssls.setup({
  capabilities = vim.lsp.protocol.make_client_capabilities(),
})

lsp.setup()

-- Configure autocompletion
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  mapping = {
    ['<Tab>'] = cmp_action.tab_complete(),
    ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
    ['<CR>'] = cmp.mapping.confirm({select = false}),
  },
  sources = {
    {name = 'nvim_lsp'},
    {name = 'buffer'},
    {name = 'path'},
    {name = 'luasnip'},
  },
})

-- Disable inline diagnostics (since you had virtual_text = false)
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
