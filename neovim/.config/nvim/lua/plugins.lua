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
    lazy = false,        -- Load immediately
    priority = 1000,     -- Load before other plugins
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
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function() require('config.nvimtree') end,
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
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'L3MON4D3/LuaSnip' },
      { 'saadparwaiz1/cmp_luasnip' },
    },
    config = function() require('config.lsp') end,
  },

  -- Git integration
  {
    'lewis6991/gitsigns.nvim',
    config = function() require('config.gitsigns') end,
  },
  {
    'tpope/vim-fugitive',
    lazy = false,
  },
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
    ft = 'vue'
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
