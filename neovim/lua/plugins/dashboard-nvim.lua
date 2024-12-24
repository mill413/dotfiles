return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        local function key(shortcut)
            shortcut.icon_hl = shortcut.icon_hl or "Title"
            shortcut.desc_hl = shortcut.desc_hl or "String"
            shortcut.key_hl = shortcut.key_hl or "Keyword"
            return shortcut
        end
        require('dashboard').setup {
            theme = "doom",
            config = {
                header = { "", "", "", "", "",
                    " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗ ",
                    " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║ ",
                    " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║ ",
                    " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ",
                    " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║ ",
                    " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ",
                    "", "", "" },
                center = {
                    key {
                        icon = "  ",
                        desc = "FZF",
                        key = "fw",
                        action = "FzfLua"
                    },
                    key {
                        icon = "  ",
                        desc = "Find Files",
                        key = "ff",
                        action = "FzfLua files"
                    },
                    key {
                        icon = "  ",
                        desc = "Recent Files",
                        key = "ff",
                        action = "FzfLua files"
                    },
                    key {
                        icon = "  ",
                        desc = "Find Word",
                        key = "fr",
                        action = "FzfLua oldfiles"
                    },
                    key {
                        icon = "󰒲  ",
                        desc = "Plugins",
                        key = "<leader>lp",
                        action = "Lazy"
                    },
                    key {
                        icon = "  ",
                        desc = "Help",
                        key = "fh",
                        action = "FzfLua help_tags"
                    },
                    key {
                        icon = "󰗽  ",
                        desc = "Quit",
                        key = "q",
                        action = "quit"
                    } },
                footer = { "🎉 Computer has no magic 🎉", "", "🎉 计算机的世界没有魔法 🎉" }
            }, -- config
            hide = {
                statusline = false,
            }
        }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
