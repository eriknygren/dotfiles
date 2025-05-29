require('nvim-tree').setup({
  filters = {
    dotfiles = false,
    custom = { '^.git$', '^node_modules$' },
  },
  git = {
    enable = true,
    ignore = false,
  },
  view = {
    width = 30,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
        folder = true,
        file = true,
      },
    },
  },
})
