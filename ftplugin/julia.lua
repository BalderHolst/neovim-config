local map = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- mappings
map('n', 'å', ':w | !julia %<cr>', opts) -- run

