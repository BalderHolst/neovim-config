require("plugins.packer") -- main packer file

require("plugins.treesitter")
-- require("plugins.markid")
require("plugins.treesitter-context")

require("plugins.telescope")
require("plugins.lsp")
-- require("plugins.cmp")
require("plugins.autopairs")
require("plugins.luasnip")
-- require("plugins.project")
-- require("plugins.neuron")
-- require("plugins.lualine")
-- require("plugins.null-ls")
require("plugins.mdeval")
require("plugins.colorizer")
require("plugins.zen-mode")
require("plugins.gitsigns")

-- Languages
require("plugins.flutter-tools").setup()
-- require("plugins.arduino")
