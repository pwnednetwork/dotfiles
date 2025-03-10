-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.wo.number = true
vim.wo.relativenumber = true


-- ESC mapping configuration
vim.keymap.set('i', 'jk', '<ESC>', { noremap = true, silent = true, desc = 'Exit insert mode with jk' })
