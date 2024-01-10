local cmd = vim.cmd

vim.g.mapleader = ' '

-- nvim options
vim.opt.undofile = true

-- Global options
vim.opt.laststatus = 3 -- global status line

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.mouse = "a" -- enable mouse
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.number = true -- enable numbering

vim.opt.smarttab = true
vim.opt.smartindent = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.wrap = false

cmd('au InsertEnter * norm zz')


-- Filetypes
vim.api.nvim_create_autocmd("BufWinEnter", { pattern = "*.dart" , command = "set filetype=dart" })

vim.g.markdown_fenced_languages = {'python', 'cpp'} -- enable highlighting for these languages in markdown files.


vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true


-- Extras 
local yank_group = vim.api.nvim_create_augroup('HighlightYank', {})
local autocmd = vim.api.nvim_create_autocmd
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 70,
        })
    end,
})

