return
{
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        require "nvim-treesitter.configs".setup {

            ensure_installed = {
                "markdown",
                "python",
                "lua",
                "rust",
                "toml",
                "json",
                "nix",
            },
            sync_install = true,
            auto_install = true,

            highlight = {
                enable = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = { "markdown" },
                },
            },

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "+",
                    node_incremental = "+",
                    scope_incremental = nil,
                    node_decremental = "-",
                },
            },

            playground = {
                enable = true,
                disable = {},
                updatetime = 25,             -- Debounced time for highlighting nodes in the playground from source code
                persist_queries = false,     -- Whether the query persists across vim sessions
                keybindings = {
                    toggle_query_editor = 'o',
                    toggle_hl_groups = 'i',
                    toggle_injected_languages = 't',
                    toggle_anonymous_nodes = 'a',
                    toggle_language_display = 'I',
                    focus_language = 'f',
                    unfocus_language = 'F',
                    update = 'R',
                    goto_node = '<cr>',
                    show_help = '?',
                },
            }
        }
    end
}
