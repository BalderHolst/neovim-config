require("plugins.packer") -- main packer file

require("plugins.treesitter")
require("plugins.treesitter-context")

require("plugins.telescope")
require("plugins.lsp")
require("plugins.cmp")
require("plugins.luasnip")
require("plugins.autopairs")
require("plugins.colorizer")
require("plugins.zen-mode")
require("plugins.gitsigns")

-- Languages
require("plugins.flutter-tools").setup()
require("plugins.rust-tools")
require("plugins.mdeval")
