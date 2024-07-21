require("settings")
require("mappings")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local lazy_opts = { change_detection = { enabled = false } }

require("lazy").setup({
    spec = {
        { import = "plugins" },
        { import = "colors.bamboo" },
    },
    lazy_opts
})

