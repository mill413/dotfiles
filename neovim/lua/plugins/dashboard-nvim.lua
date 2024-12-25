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
                        desc = "Telescope",
                        key = "ts",
                        action = "Telescope"
                    },
                    key {
                        icon = "  ",
                        desc = "Find Files",
                        key = "ff",
                        action = "Telescope find_files"
                    },
                    key {
                        icon = "  ",
                        desc = "Recent Files",
                        key = "rf",
                        action = "Telescope oldfiles"
                    },
                    key {
                        icon = "  ",
                        desc = "Find Word",
                        key = "fw",
                        action = "Telescope live_grep"
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
                        key = "th",
                        action = "Telescope help_tags"
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
