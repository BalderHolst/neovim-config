local map = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- settings


-- mappings
map('n', 'å', ':w | !g++ % -o out && ./out <cr>', opts) -- run

