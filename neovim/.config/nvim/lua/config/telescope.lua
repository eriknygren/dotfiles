local telescope = require('telescope')

telescope.setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      ".git",
      ".DS_Store",
    },
    mappings = {
      i = {
        ["<esc>"] = require('telescope.actions').close,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
  },
})
