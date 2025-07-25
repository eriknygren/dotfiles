local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin specs
return require('lazy').setup({
  -- Color scheme
  {
    "morhetz/gruvbox",
    lazy = false,    -- Load immediately
    priority = 1000, -- Load before other plugins
    config = function()
      vim.g.gruvbox_contrast_dark = 'soft'
      vim.cmd.colorscheme('gruvbox')
    end,
  },
  -- Core plugins
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function() require('config.telescope') end,
  },
  {
    'mileszs/ack.vim',
    lazy = false,
    priority = 999,
    config = function()
      -- Use ripgrep instead of ack
      vim.g.ackprg = 'rg --vimgrep --no-heading -F'
      vim.cmd([[
      cnoreabbrev ag Ack
      cnoreabbrev aG Ack
      cnoreabbrev Ag Ack
      cnoreabbrev AG Ack
      cnoreabbrev ack Ack
      ]])
      vim.cmd('runtime! plugin/ack.vim')
    end,
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function() require('config.nvimtree') end,
  },
  -- Snacks notifier to help with disappearing status bar messages
  {
    "folke/snacks.nvim",
    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = false },
      git = { enabled = true },
      indent = { enabled = false },
      input = { enabled = false },
      notifier = { enabled = true },
      quickfile = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      terminal = { enabled = false },
      toggle = { enabled = false },
      win = { enabled = false },
      words = { enabled = false },
      zen = { enabled = false },
    },
  },

  -- LSP and completion
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim',           version = "^1.0.0" },
      { 'williamboman/mason-lspconfig.nvim', version = "^1.0.0" },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
    },
    config = function() require('config.lsp') end,
  },

  -- Git integration
  {
    'lewis6991/gitsigns.nvim',
    config = function() require('config.gitsigns') end,
  },
  'tpope/vim-fugitive',
  -- Buffer line
  {
    'romgrk/barbar.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function() require('config.barbar') end,
  },

  -- Language-specific
  'tpope/vim-rails',
  'pangloss/vim-javascript',
  {
    'leafOfTree/vim-vue-plugin',
    ft = 'vue',
    config = function()
      vim.g.vim_vue_plugin_config = {
        syntax = {
          template = { 'html' },
          script = { 'javascript', 'typescript' },
          style = { 'css', 'scss' },
        },
        full_syntax = {},
        initial_indent = {},
        attribute = 0,
        keyword = 0,
        foldexpr = 0,
        debug = 0,
      }
    end,
  },

  -- Editing enhancements
  'tpope/vim-endwise',
  {
    'mattn/emmet-vim',
    ft = { 'html', 'css', 'javascript', 'typescript', 'vue' }
  },
  'ntpeters/vim-better-whitespace',
  'terryma/vim-expand-region',

  -- GitHub Copilot
  {
    'github/copilot.vim',
    config = function()
      vim.g.copilot_enabled = false
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap('i', '<C-w>', 'copilot#Accept("<CR>")', { expr = true, silent = true })
    end,
  },

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function() require('config.lualine') end,
  },
})
