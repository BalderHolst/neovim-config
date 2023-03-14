local map = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- settings


-- mappings
map('n', 'å', ':w | !g++ *.cpp && ./a.out <cr>', opts) -- run

