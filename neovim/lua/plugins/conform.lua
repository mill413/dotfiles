return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            svelte = { "prettier" },
            css = { "prettier" },
            html = { "prettier" },
            json = { "prettier" },
            yaml = { "prettier" },
            markdown = { "prettier" },
            graphql = { "prettier" },
            -- lua = { "stylua" },
            python = { "isort", "autopep8" },
            rust = { "rustfmt" },
        },
        format_on_save = {
            lsp_fallback = true,
            async = false,
            timeout_ms = 500,
        },
        formatters = {
            -- rustfmt = {
            --     command = vim.fn.expand("~") .. "/.cargo/bin/rustfmt"
            -- },
            -- stylua = {
            --     command = vim.fn.expand("~") .. ".local/share/nvim/mason/bin/stylua"
            -- },
            autopep8 = {
                command = vim.fn.expand("~") .. ".local/share/nvim/mason/bin/autopep8"
            },
            isort = {
                command = vim.fn.expand("~") .. ".local/share/nvim/mason/bin/isort"
            }
        },
    },
    keys = {
        {
            "<leader>fc",
            function()
                require("conform").format({
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 500,
                })
            end,
            mode = { "n", "v" },
            desc = "Format file or range (in visual mode)",
        },
    },
    event = { "BufReadPre", "BufNewFile" },
}
