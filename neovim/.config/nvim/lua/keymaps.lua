local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Pane navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-j>', '<C-w>j', opts)

-- Save shortcuts
map('n', '<C-s>', ':w<CR>', opts)
map('i', '<C-s>', '<Esc>:w<CR>', opts)
map('v', '<C-s>', '<Esc>:w<CR>', opts)

-- File explorer
map('n', '<C-n>', ':NvimTreeToggle<CR>', opts)

-- Telescope mappings
map('n', '<C-p>', ':Telescope find_files<CR>', opts)
map('n', '<C-a>', ':Telescope live_grep<CR>', opts)
map('n', '<Leader>fg', ':Telescope live_grep<CR>', opts)
map('n', '<Leader>fb', ':Telescope buffers<CR>', opts)
map('n', '<Leader>fh', ':Telescope help_tags<CR>', opts)

-- Buffer navigation
map('n', '<S-h>', ':BufferPrevious<CR>', opts)
map('n', '<S-l>', ':BufferNext<CR>', opts)
map('n', '<Leader>q', ':BufferClose<CR>', opts)
map('n', '<Leader>Q', ':only<CR>:BufferCloseAllButCurrent<CR>', opts)

-- Buffer goto position
for i = 1, 9 do
  map('n', string.format('<A-%s>', i), string.format(':BufferGoto %s<CR>', i), opts)
end
map('n', '<A-0>', ':BufferLast<CR>', opts)

-- Split window
map('n', '<Leader>v', ':vsp<CR>', opts)
map('n', '<Leader>c', ':sp<CR>', opts)

-- Format code
map('n', '<Leader>f', ':lua vim.lsp.buf.format({ async = true })<CR>', opts)
map('n', '<Leader>i', 'gg=G\'\'', opts) -- Auto indent whole file

-- Clear search highlighting
map('n', '<Leader>C', ':let @/ = ""<CR>', opts)

-- LSP bindings
map('n', '<space>e', vim.diagnostic.open_float, opts)
map('n', 'gd', vim.lsp.buf.definition, opts)
map('n', 'K', vim.lsp.buf.hover, opts)
map('n', '<Leader>rn', vim.lsp.buf.rename, opts)
map('n', '<Leader>ca', vim.lsp.buf.code_action, opts)

-- Copilot accept with Ctrl-w
-- This will be configured via lazy.nvim plugin config

-- Diagnostics navigation
map('n', '[d', vim.diagnostic.goto_prev, opts)
map('n', ']d', vim.diagnostic.goto_next, opts)
