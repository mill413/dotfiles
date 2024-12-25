return {
    "folke/edgy.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
        require("edgy").setup({
            animate = {
                enabled = true, -- 是否启用动画
                fps = 60, -- 动画帧率
                cps = 120 -- 每秒字符数
            },
            right = {{
                title = "File Explorer", -- 给 nvim-tree 起个名字
                ft = "NvimTree", -- 文件类型
                size = {
                    width = 42
                }, -- 高度
                open = function() -- 打开时调用的函数
                    vim.cmd("NvimTreeOpen")
                end
            }, {
                title = "Outline", -- 给 outline.nvim 起个名字
                ft = "Outline", -- 文件类型
                size = {
                    width = 42
                }, -- 高度
                open = function() -- 打开时调用的函数
                    vim.cmd("OutlineOpen")
                end
            }},
            bottom = { -- 将 toggleterm 添加到底部
            {
                title = "Terminal", -- 窗口标题
                ft = "toggleterm", -- 匹配 filetype
                size = {
                    height = 25
                }, -- 默认高度
                open = function()
                    vim.cmd("ToggleTerm direction=horizontal")
                end
            }},
            options = {
                right = {
                    winfixwidth = true
                }
                -- bottom = {
                --     winfixheight = true,
                -- },
            }
        })
    end
}
