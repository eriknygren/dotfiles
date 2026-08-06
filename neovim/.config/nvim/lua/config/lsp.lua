-- Native nvim 0.11 LSP setup (vim.lsp.config/enable + nvim-lspconfig configs)
-- https://vonheikemen.github.io/learn-nvim/feature/lsp-setup.html

require('mason').setup()

-- LSP keymaps, mirroring the old lsp-zero defaults
-- (gd and K are already mapped globally in keymaps.lua)
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local opts = { buffer = event.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format({ async = true }) end, opts)
    vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
  end,
})

-- Advertise nvim-cmp's completion capabilities to every server
vim.lsp.config('*', {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

-- Configure lua language server for neovim
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      telemetry = { enable = false },
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.fn.expand('$VIMRUNTIME/lua'),
          vim.fn.stdpath('config') .. '/lua',
        },
      },
    },
  },
})

-- Ruby LSP configuration
vim.lsp.config('ruby_lsp', {
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

local vue_language_server_path = vim.fn.stdpath('data') .. '/mason/packages/vue-language-server/node_modules/@vue/language-server'

-- Vue + TypeScript configuration
vim.lsp.config('ts_ls', {
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
})

vim.lsp.config('vue_ls', {
  on_attach = function(client, bufnr)
    -- Disable Volar's formatting, using eslint only for vue files
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
})

-- Install these servers; mason-lspconfig enables every installed server
require('mason-lspconfig').setup({
  ensure_installed = {
    'ts_ls',
    'eslint',
    'ruby_lsp',
    'rubocop',
    'cssls',
    'vue_ls',
    'stylelint_lsp',
    'lua_ls'
  },
})

-- Configure autocompletion
local cmp = require('cmp')

cmp.setup({
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping(function(fallback)
      local col = vim.fn.col('.') - 1
      local cursor_at_start_or_whitespace = col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')

      if cmp.visible() then
        cmp.select_next_item()
      elseif cursor_at_start_or_whitespace then
        fallback()
      else
        cmp.complete()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<CR>'] = cmp.mapping.confirm({select = false}),
  },
  sources = {
    {name = 'nvim_lsp'},
    {name = 'path'},
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
