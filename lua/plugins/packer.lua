local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Packer can manage itself

    -- Dependencies
    use 'nvim-lua/plenary.nvim' -- Telescope and flutter-tools dependency

    -- Colorschemes
    use "EdenEast/nightfox.nvim" -- Colorscheme
    use "ellisonleao/gruvbox.nvim" -- gruvbox colorscheme
    use "bluz71/vim-moonfly-colors" -- moonfly colorscheme
    use "sainnhe/sonokai"
    use "folke/tokyonight.nvim"
    use { 'Everblush/everblush.nvim', as = 'everblush' }
    use { 'rose-pine/neovim', as = 'rose-pine' }

    -- Misc
    use 'tpope/vim-commentary' -- comment out lines with gcc and gc
    use 'windwp/nvim-autopairs' -- Autopairs, integrates with both cmp and treesitter
    use 'norcalli/nvim-colorizer.lua' -- preview colors
    use 'folke/zen-mode.nvim'
    use 'lewis6991/gitsigns.nvim' -- Git symbols
    use 'tpope/vim-fugitive' -- Awesome git commands
    use 'epwalsh/obsidian.nvim' -- Obsidian notes
    use 'RRethy/nvim-align' -- align things
    use 'mg979/vim-visual-multi' -- multi-cursor
    -- use 'hkupty/iron.nvim'
    -- use 'theprimeagen/harpoon'
    -- use 'junegunn/goyo.vim' -- Center and hide tui
    -- use 'oberblastmeister/neuron.nvim'
    -- use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } } -- lua status line
    -- use "ahmedkhalf/project.nvim" -- roots nvim in git repos and keeps list of projects (integrates with telescope)

    -- Telescope
    use 'nvim-telescope/telescope.nvim' -- main telescope
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } -- native fuzzy finder for telescope (better, faster, stronger!)
    use "nvim-telescope/telescope-file-browser.nvim"


    -- -- cmp plugins
    -- use "hrsh7th/nvim-cmp" -- The completion plugin
    -- use "hrsh7th/cmp-buffer" -- buffer completions
    -- use "hrsh7th/cmp-path" -- path completions
    -- -- use "hrsh7th/cmp-cmdline" -- cmdline completions
    -- use "saadparwaiz1/cmp_luasnip" -- snippet completion
    -- use "hrsh7th/cmp-nvim-lsp" -- LSP
    -- use "hrsh7th/cmp-nvim-lua" -- vim type in lua config

    -- -- LSP
    -- use "neovim/nvim-lspconfig" -- enable LSP
    -- use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    -- use "jose-elias-alvarez/null-ls.nvim" -- formatter and linter
    --
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- { 'williamboman/mason.nvim' }, -- does not work on nixos
            -- { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    -- More language Plugins
    use { 'autozimu/LanguageClient-neovim', run = "bash ./install.sh" } -- rust
    use 'simrat39/rust-tools.nvim' -- rust
    use 'dart-lang/dart-vim-plugin' -- Dart
    use { 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim' } -- Flutter
    use 'https://github.com/jubnzv/mdeval.nvim' -- markdown code blocks
    use 'ixru/nvim-markdown'
    -- use 'thosakwe/vim-flutter' -- Flutter
    -- use { "vlelo/arduino-helper.nvim" } -- Arduino (requires arduino-cli)
    use "https://github.com/stevearc/vim-arduino"

    -- snippets
    -- use "L3MON4D3/LuaSnip" --snippet engine
    -- use "rafamadriz/friendly-snippets" -- a bunch of snippets to use


    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/playground'
    use 'David-Kunz/markid'
    use 'nvim-treesitter/nvim-treesitter-context'

    if packer_bootstrap then
        require('packer').sync()
    end

end)
