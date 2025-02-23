-- Custom keymaps
local function my_on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
        }
    end

    -- Get listed and loaded buffers
    local function get_loaded_buffers(filter)
        local buffers = vim.api.nvim_list_bufs()
        local loaded_buffers = {}

        for _, buf in ipairs(buffers) do
            if vim.api.nvim_buf_is_loaded(buf) then
                if filter(buf) then
                    table.insert(loaded_buffers, buf)
                end
            end
        end

        return loaded_buffers
    end

    -- Close empty buffers when opening files
    local function custom_open()
        local node = api.tree.get_node_under_cursor()

        if node.type == "Folder" or node.type == "Root" then
            api.node.open.edit()
        else
            api.node.open.edit()
            local notempty_buffers = get_loaded_buffers(function(buf)
                local buf_name = vim.fn.bufname(buf)
                return not (buf_name:find("NvimTree") or buf_name == "")
            end)

            local buffers = get_loaded_buffers(function(buf)
                local buf_name = vim.fn.bufname(buf)
                return not buf_name:find("NvimTree")
            end)

            if #notempty_buffers > 0 then
                for _, buf in ipairs(buffers) do
                    if vim.fn.bufname(buf) == "" then
                        vim.cmd(":bd" .. vim.fn.bufnr(buf))
                    end
                end
                api.tree.open()
            end
        end
    end

    -- Set mappings
    local mappings = {
        -- BEGIN_DEFAULT_ON_ATTACH
        -- ["<C-e>"] = {api.node.open.replace_tree_buffer, "Open: In Place"},
        ["<C-k>"] = { api.node.show_info_popup, "Info" },

        -- ["<Tab>"] = {api.node.open.preview, "Open Preview"},
        [">"] = { api.node.navigate.sibling.next, "Next Sibling" },
        ["<"] = { api.node.navigate.sibling.prev, "Previous Sibling" },
        ["."] = { api.node.run.cmd, "Run Command" },
        ["bmv"] = { api.marks.bulk.move, "Move Bookmarked" },
        ["B"] = { api.tree.toggle_no_buffer_filter, "Toggle No Buffer" },
        -- ["C"] = {api.tree.toggle_git_clean_filter, "Toggle Git Clean"},
        ["[c"] = { api.node.navigate.git.prev, "Prev Git" },
        ["]c"] = { api.node.navigate.git.next, "Next Git" },
        ["]e"] = { api.node.navigate.diagnostics.next, "Next Diagnostic" },
        ["[e"] = { api.node.navigate.diagnostics.prev, "Prev Diagnostic" },
        ["F"] = { api.live_filter.clear, "Clean Filter" },
        ["f"] = { api.live_filter.start, "Filter" },
        -- ["I"] = {api.tree.toggle_gitignore_filter, "Toggle Git Ignore"},
        --
        ["J"] = { api.node.navigate.sibling.last, "Last Sibling" },
        ["K"] = { api.node.navigate.sibling.first, "First Sibling" },
        ["m"] = { api.marks.toggle, "Toggle Bookmark" },
        ["O"] = { api.node.open.no_window_picker, "Open: No Window Picker" },
        ["q"] = { api.tree.close, "Close" },
        -- ["s"] = {api.node.run.system, "Run System"},
        ["S"] = { api.tree.search_node, "Search" },
        ["U"] = { api.tree.toggle_custom_filter, "Toggle Hidden" },
        -- END_DEFAULT_ON_ATTACH

        -- Mappings migrated from view.mappings.list
        -- Open node
        ["<leader>e"] = { api.node.open.edit, "" },
        ["<CR>"] = { custom_open, "Open" },
        ["o"] = { api.node.open.tab, "Open" },
        ["t"] = { api.node.open.tab, "Open: New Tab" },
        ["v"] = { api.node.open.vertical, "Open: Vertical Split" },
        ["s"] = { api.node.open.horizontal, "Open: Horizontal Split" },
        ["<BS>"] = { api.node.navigate.parent_close, "Close Directory" },
        -- Rename
        ["r"] = { api.fs.rename, "Rename" },
        ["e"] = { api.fs.rename_basename, "Rename: Basename" },
        ["<C-r>"] = { api.fs.rename_sub, "Rename: Omit Filename" }, -- ?
        -- Change root
        ["C"] = { api.tree.change_root_to_node, "CD" },
        ["-"] = { api.tree.change_root_to_parent, "Up" }, -- choose another
        -- Delete file
        ["<C-d>"] = { api.fs.remove, "Delete" },
        ["d"] = { api.fs.trash, "Trash" },

        ["a"] = { api.fs.create, "Create" },
        -- Copy and Paste
        ["x"] = { api.fs.cut, "Cut" },
        ["c"] = { api.fs.copy.node, "Copy" },
        ["y"] = { api.fs.copy.filename, "Copy Name" },
        ["gy"] = { api.fs.copy.absolute_path, "Copy Absolute Path" },
        ["Y"] = { api.fs.copy.relative_path, "Copy Relative Path" },
        ["p"] = { api.fs.paste, "Paste" },
        -- Collapse and Expand
        ["W"] = { api.tree.collapse_all, "Collapse" },
        ["E"] = { api.tree.expand_all, "Expand All" },

        ["P"] = { api.node.navigate.parent, "Parent Directory" },
        ["<C-h>"] = { api.tree.toggle_hidden_filter, "Toggle Dotfiles" },

        ["?"] = { api.tree.toggle_help, "Help" },
        -- ["h"] = {api.node.navigate.parent_close, "Close Directory"},
    }
    for keys, mapping in pairs(mappings) do
        vim.keymap.set("n", keys, mapping[1], opts(mapping[2]))
    end
end

-- Smart nvim-tree toggling and focusing
local nvimTreeFocusOrToggle = function()
    local nvimTree = require("nvim-tree.api")
    local currentBuf = vim.api.nvim_get_current_buf()
    local currentBufFt = vim.api.nvim_get_option_value("filetype", {
        buf = currentBuf,
    })
    if currentBufFt == "NvimTree" then
        vim.cmd("wincmd h")
    else
        nvimTree.tree.focus()
    end
end

-- Open nvim-treee in startup
local function open_nvim_tree(data)
    -- buffer is a real file on the disk
    local real_file = vim.fn.filereadable(data.file) == 1

    -- buffer is a [No Name]
    -- local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

    -- buffr is a directory
    local dir = vim.fn.isdirectory(data.file) == 1

    if not real_file and not dir then
        return
    end

    -- open the tree, change directory to file
    if dir then
        vim.cmd.enew()
        vim.cmd.bw(data.buf)
        vim.cmd.cd(data.file)
        require("nvim-tree.api").tree.open()
        return
    end

    -- open the tree, find the file
    if real_file then
        require("nvim-tree.api").tree.toggle({
            focus = false,
            find_file = true,
        })
        return
    end
end
-- local function open_nvim_tree(data)
--
--   -- buffer is a directory
--   local directory = vim.fn.isdirectory(data.file) == 1
--
--   if not directory then
--     return
--   end
--
--   -- change to the directory
--   vim.cmd.cd(data.file)
--
--   -- open the tree
--   require("nvim-tree.api").tree.open()
-- end
vim.api.nvim_create_autocmd({ "VimEnter" }, {
    callback = open_nvim_tree,
})


-- Auto close TODO-关闭文件后不自动关闭tree
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        -- 获取窗口总数
        local win_count = vim.fn.winnr("$")

        -- 检查当前缓冲区是否是 nvim-tree
        local buf_ft = vim.bo.filetype
        if win_count == 1 and buf_ft == "NvimTree" then
            vim.defer_fn(function()
                -- 安全加载 nvim-tree API
                local ok, nvim_tree_api = pcall(require, "nvim-tree.api")
                if ok then
                    nvim_tree_api.tree.toggle()
                else
                    vim.notify("Failed to load nvim-tree API", vim.log.levels.ERROR)
                end
            end, 10) -- 延迟 10 毫秒
        end
    end,
})

return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        {
            "<A-e>",
            nvimTreeFocusOrToggle,
            mode = "n",
            desc = "Smart nvim-tree toggling and focusing",
        },
    },
    opts = {
        hijack_netrw = true,
        hijack_directories = {
            enable = false,
            auto_open = false,
        },
        view = {
            side = "right",
            -- width = {
            --     max = 42,
            -- },
            width = 42,
            adaptive_size = true,
        },
        renderer = {
            highlight_opened_files = "name",
            indent_markers = {
                enable = true,
            },
        },
        filters = {
            dotfiles = true,
        },
        on_attach = my_on_attach,
        filesystem_watchers = {
            enable = true,
        },
        sync_root_with_cwd = true,
        actions = {
            change_dir = {
                enable = true, -- 启用 change_dir 功能
                global = true,
            },
        },
    },
}
