return { {
    "williamboman/mason.nvim",
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            },
            border = "rounded"
        }
    }
}, {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
        ensure_installed = { "lua_ls", -- lua
                             "rust_analyzer", -- rust
                             "jedi_language_server", -- python
                             "clangd", -- c/cpp
                             "bashls", -- bash/shell
                             "texlab", -- latex
                             "kotlin_language_server", -- kotlin
                             "jdtls", -- java
                            }
    }
}, {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
        vim.diagnostic.config({
            virtual_text = true,
            update_in_insert = true,
            underline = true,
            severity_sort = true
        })

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require("lspconfig")

        lspconfig.lua_ls.setup({
            capabilities = capabilities
        })
        lspconfig.jedi_language_server.setup({
            capabilities = capabilities
        })
        lspconfig.clangd.setup({
            capabilities = capabilities
        })
        lspconfig.texlab.setup({
            capabilities = capabilities
        })
        lspconfig.bashls.setup({
            capabilities = capabilities
        })
        lspconfig.rust_analyzer.setup({
            capabilities = capabilities
        })
        lspconfig.kotlin_language_server.setup({
            capabilities = capabilities
        })
        lspconfig.jdtls.setup({
            capabilities = capabilities
        })
    end
} }
