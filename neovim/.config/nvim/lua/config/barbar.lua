-- Just setup defaults, keymaps are in keymaps.lua
require('barbar').setup({
  animation = true,
  auto_hide = false,
  tabpages = true,
  closable = true,
  clickable = true,
  icons = {
    buffer_index = true,
    buffer_number = false,
    filetype = {
      enabled = true,
    },
  },
})
