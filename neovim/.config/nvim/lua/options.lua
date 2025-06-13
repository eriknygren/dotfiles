local opt = vim.opt
local g = vim.g

-- General settings
opt.shell = '/bin/sh'
opt.mouse = 'a'
opt.number = true
opt.termguicolors = true
opt.clipboard = 'unnamed'
opt.swapfile = false
opt.backup = false
opt.wrap = false
opt.incsearch = true
opt.hlsearch = true
opt.autoindent = true
opt.copyindent = true
opt.showmatch = true
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.backspace = 'indent,eol,start'
opt.laststatus = 2
opt.ttyfast = true
opt.lazyredraw = true
opt.autowriteall = true
opt.inccommand = ""
opt.laststatus = 3
opt.splitright = true
opt.pumheight = 10

g._ts_force_sync_parsing = true

-- Set leader key
g.mapleader = ','

-- Set colorscheme safely (only if it exists)
local ok, _ = pcall(vim.cmd.colorscheme, 'gruvbox')
if not ok then
  vim.cmd.colorscheme('default')  -- fallback to default
end

-- Use ripgrep if available
if vim.fn.executable('rg') == 1 then
  opt.grepprg = 'rg --color=never'
end

-- Disable LSP progress messages that clear the command line
vim.lsp.handlers["$/progress"] = function() end


-- Type :Mergetool to get a 3 pane split diff mergy view thing
vim.api.nvim_create_user_command('Mergetool', function()
  vim.cmd('Gvdiffsplit!')
end, {})
