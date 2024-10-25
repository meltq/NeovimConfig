local plugins = {
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "clangd",
                "clang-format",
                "asm-lsp",
                "rust-analyzer",
            }
        }
    },
    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function()
            vim.g.rustfmt_autosave = 1
        end
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^4",
        ft = { "rust" },
        dependencies = "neovim/nvim-lspconfig",
        config = function()
            require "custom.configs.rustaceanvim"
        end
    },
    {
        "mfussenegger/nvim-dap",
        init = function()
            require("core.utils").load_mappings("dap")
        end
    },
}
return plugins
