-- kevinhwang91/nvim-bqf - bqf {{{
local bqf_ok, bqf = pcall(require, "bqf")
if bqf_ok then
    bqf.setup({ auto_enable = true })
end
-- }}}

-- rebelot/kanagawa.nvim = kanagawa {{{
local kanagawa_ok, kanagawa = pcall(require, "kanagawa")
if kanagawa_ok then
    kanagawa.setup()
    vim.cmd("colorscheme kanagawa")
end
-- }}}

-- ui folke/trouble.nvim - trouble {{{
local trouble_ok, trouble = pcall(require, "trouble")
if trouble_ok then
    trouble.setup({
        position = "right", -- 侧边栏显示在右侧
        width = 50,         -- 侧边栏宽度
        height = 10,        -- 侧边栏高度
        padding = false,    -- 不使用内边距
        mode = "document_diagnostics", -- 默认只显示当前文档诊断
        group = true, -- 分组相似诊断
        cycle_results = false, -- 不循环结果
        auto_jump = {}, -- 自动跳转到特定诊断类型
    })
end
-- }}}

-- ui folke/todo-comments.nvim - todo-comments {{{
local todo_comments_ok, todo_comments = pcall(require, "todo-comments")
if todo_comments_ok then
    todo_comments.setup()
end
-- }}}

-- folke/flash.nvim - flash {{{
local flash_ok, flash = pcall(require, "flash")
if flash_ok then
    flash.setup({
        labels = "abcdefghijklmnopqrstuvwxyz",
        search = {
            mode = "fuzzy",
        },
        jump = {
            autojump = true,
        },
    })
end
-- }}}


-- telescope
-- nvim-telescope/telescope.nvim - telescope {{{
local telescope_ok, telescope = pcall(require, "telescope")
if telescope_ok then
    local actions = require "telescope.actions"
    telescope.setup({
        defaults = {
            prompt_prefix = " ",
            selection_caret = " ",
            path_display = { "smart" },

            mappings = {
                i = {
                    ["<CR>"] = actions.select_default,
                    ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                    ["<C-n>"] = actions.move_selection_next,
                    ["<C-p>"] = actions.move_selection_previous,

                    ["<C-c>"] = actions.close,

                    ["<Down>"] = actions.move_selection_next,
                    ["<Up>"] = actions.move_selection_previous,

                    ["<C-x>"] = actions.select_horizontal,
                    ["<C-v>"] = actions.select_vertical,
                    ["<C-t>"] = actions.select_tab,

                    ["<C-u>"] = actions.preview_scrolling_up,
                    ["<C-d>"] = actions.preview_scrolling_down,

                    ["<PageUp>"] = actions.results_scrolling_up,
                    ["<PageDown>"] = actions.results_scrolling_down,

                    ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                    ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                    ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    ["<C-l>"] = actions.complete_tag,
                    ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
                },

                n = {
                    ["<esc>"] = actions.close,
                    ["<CR>"] = actions.select_default,
                    ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                    ["<C-x>"] = actions.select_horizontal,
                    ["<C-v>"] = actions.select_vertical,
                    ["<C-t>"] = actions.select_tab,

                    ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                    ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                    ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

                    ["<c-n>"] = actions.move_selection_next,
                    ["<c-p>"] = actions.move_selection_previous,
                    ["H"] = actions.move_to_top,
                    ["M"] = actions.move_to_middle,
                    ["L"] = actions.move_to_bottom,

                    ["<Down>"] = actions.move_selection_next,
                    ["<Up>"] = actions.move_selection_previous,
                    ["gg"] = actions.move_to_top,
                    ["G"] = actions.move_to_bottom,

                    ["<C-u>"] = actions.preview_scrolling_up,
                    ["<C-d>"] = actions.preview_scrolling_down,

                    ["<PageUp>"] = actions.results_scrolling_up,
                    ["<PageDown>"] = actions.results_scrolling_down,

                    ["?"] = actions.which_key,
                },
            },
        },
        pickers = {},
        extensions = {},
    })
end
-- }}}


-- windwp/nvim-autopairs - nvim-autopairs {{{
local autopairs_ok, autopairs = pcall(require, "nvim-autopairs")
if autopairs_ok then
    autopairs.setup {
        check_ts = true,
        ts_config = {
            lua = { "string", "source" },
            javascript = { "string", "template_string" },
            java = false,
        },
        disable_filetype = { "TelescopePrompt", "spectre_panel" },
        fast_wrap = {
            map = "<M-e>",
            chars = { "{", "[", "(", '"', "'" },
            pattern = string.gsub([[ [%"%"%)%>%]%)%}%,] ]], "%s+", ""),
            offset = 0, -- Offset from pattern match
            end_key = "$",
            keys = "qwertyuiopzxcvbnmasdfghjkl",
            check_comma = true,
            highlight = "PmenuSel",
            highlight_grey = "LineNr",
        },
    }

end

-- }}}

-- ahmedkhalf/project.nvim - project_nvim {{{
local project_nvim_ok, project_nvim = pcall(require, "project_nvim")
if project_nvim_ok then
    project_nvim.setup({
        active = true,
        on_config_done = nil,
        manual_mode = false,
        detection_methods = { "pattern", "lsp" },
        patterns = {
            ".git",
            "go.mod",
            "package.json",
            "Makefile",
            "Cargo.toml",
            "pyproject.toml",
        },
        show_hidden = false,
        silent_chdir = true,
        scope_chdir = "win",
        ignore_lsp = {},
        exclude_dirs = {
            "**/.cargo/**",
            "**/staging/**",
            "**/node_modules/**", -- Node.js 依赖
            "**/.cache/**",       -- 缓存目录
            "**/build/**",        -- 构建目录
            "**/dist/**",         -- 分发目录
            "**/tmp/**",          -- 临时目录
            "**/vendor/**",       -- Go vendor 目录
            "**/target/**",       -- Rust 构建目录
            "**/__pycache__/**",  -- Python 缓存
        },
        datapath = vim.fn.stdpath("data"),
    })

    if telescope_ok then
        pcall(telescope.load_extension, "fzf")
        pcall(telescope.load_extension, "projects")
    end

end
-- }}}


-- goolord/alpha-nvim -- alpha {{{
local alpha_ok, alpha = pcall(require, "alpha")
if alpha_ok then
    local dashboard = require "alpha.themes.dashboard"
    dashboard.section.header.val = {
        [[                               __                ]],
        [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
        [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
        [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
        [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
        [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    }
    dashboard.section.buttons.val = {
        dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
        dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
        dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
        dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
        dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
    }

    dashboard.section.footer.val = "yubo@yubo.org"

    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)
end

-- }}}

-- ui {{{

-- nvim-tree/nvim-tree.lua - nvim-tree {{{
local nvim_tree_ok, nvim_tree = pcall(require, "nvim-tree")
if nvim_tree_ok then
    local function my_on_attach(bufnr)
        local api = require("nvim-tree.api")

        local function opts(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.set("n", "C", api.tree.change_root_to_node,   opts("CD"))
        vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
        vim.keymap.set("n", "l", api.node.open.edit,             opts("Open"))
        vim.keymap.set("n", "y", api.fs.copy.node,               opts("Copy"))
        vim.keymap.set("n", "c", api.fs.create,                  opts("Create"))
        vim.keymap.set("n", "v", api.node.open.vertical,         opts("Open: Vertical Split"))
        vim.keymap.set("n", "s", api.node.open.horizontal,       opts("Open: Horizontal Split"))
    end

    nvim_tree.setup {
        on_attach = my_on_attach,
        update_focused_file = {
            enable = true,
            update_cwd = false,
        },
        renderer = {
            icons = {
                show = {
                    file = false,
                    folder = false,
                    -- folder_arrow = false,
                },
                glyphs = {
                    default = "",
                    symlink = "",
                    folder = {
                        arrow_closed = "",
                        arrow_open = "",
                        default = "",
                        open = "",
                        empty = "",
                        empty_open = "",
                        symlink = "",
                        symlink_open = "",
                    },
                    git = {
                        unstaged = "",
                        staged = "",
                        unmerged = "",
                        renamed = "",
                        untracked = "",
                        deleted = "",
                        ignored = "",
                    },
                },
            },
        },
        diagnostics = {
            enable = false,
            show_on_dirs = true,
            icons = {
                hint = "",
                info = "",
                warning = "",
                error = "",
            },
        },
        filters = {
            dotfiles = true,
            git_clean = false,
            no_buffer = false,
            custom = {},
            exclude = {".conf"},
        },
        filesystem_watchers = {
            enable = true,
            debounce_delay = 50,
            ignore_dirs = {},
        },
    }
end

-- }}}

-- akinsho/bufferline.nvim - bufferline {{{
local bufferline_ok, bufferline = pcall(require, "bufferline")
if bufferline_ok then
    bufferline.setup({
        options = {
            numbers = "none",
            indicator = { style = "none" },
            max_name_length = 30,
            max_prefix_length = 30,
            tab_size = 0,
            diagnostics = false,
            diagnostics_update_in_insert = false,
            show_buffer_icons = false,
            show_buffer_close_icons = false,
            show_close_icon = false,
            show_tab_indicators = false,
            show_duplicate_prefix = false,
            persist_buffer_sort = false,
            separator_style = {},
            enforce_regular_tabs = false,
            always_show_bufferline = true,
        },
        highlights = {
            fill = {
                fg = "#9e9e9e",
                bg = "#262626",
            },
            background = {
                fg = "#262626",
                bg = "#444444",
            },
            buffer_selected = {
                fg = "#080808",
                bg = "#AFFA02",
                italic = false,
            },
            buffer_visible = {
                fg = "#87FBAF",
                bg = "#262626",
            },
            indicator_selected = {
                fg = "#080808",
                bg = "#AFFA02",
            },
            indicator_visible = {
                fg = "#9e9e9e",
                bg = "#262626",
            },
            close_button = {
                fg = { attribute = "fg", highlight = "TabLine" },
                bg = { attribute = "bg", highlight = "TabLine" },
            },
            close_button_visible = {
                fg = { attribute = "fg", highlight = "TabLine" },
                bg = { attribute = "bg", highlight = "TabLine" },
            },
            close_button_selected = {
                fg = {attribute="fg",highlight="TabLineSel"},
                bg ={attribute="bg",highlight="TabLineSel"}
            },
            tab_selected = {
                fg = { attribute = "fg", highlight = "Normal" },
                bg = { attribute = "bg", highlight = "Normal" },
            },
            tab = {
                fg = { attribute = "fg", highlight = "TabLine" },
                bg = { attribute = "bg", highlight = "TabLine" },
            },
            tab_close = {
                fg = { attribute = "fg", highlight = "TabLine" },
                bg = { attribute = "bg", highlight = "TabLine" },
            },
            duplicate_selected = {
                fg = { attribute = "fg", highlight = "TabLine" },
                bg = { attribute = "bg", highlight = "TabLine" },
            },
            duplicate_visible = {
                fg = { attribute = "fg", highlight = "TabLine" },
                bg = { attribute = "bg", highlight = "TabLine" },
            },
            duplicate = {
                fg = { attribute = "fg", highlight = "TabLine" },
                bg = { attribute = "bg", highlight = "TabLine" },
            },
            modified = {
                fg = { attribute = "fg", highlight = "TabLine" },
                bg = { attribute = "bg", highlight = "TabLine" },
            },
            modified_selected = {
                fg = { attribute = "fg", highlight = "Normal" },
                bg = { attribute = "bg", highlight = "Normal" },
            },
            modified_visible = {
                fg = { attribute = "fg", highlight = "TabLine" },
                bg = { attribute = "bg", highlight = "TabLine" },
            },
        },

    })
end

-- }}}

-- nvim-lualine/lualine.nvim - lualine {{{
local lualine_ok, lualine = pcall(require, "lualine")
if lualine_ok then
    local filetype = {
        "filetype",
        icons_enabled = false,
        icon = nil,
    }

    local branch = {
        "branch",
        icons_enabled = true,
        icon = "",
    }

    local location = {
        "location",
    }

    local filename = {
        "filename",
        path = 3,
        shorting_target = 40,
    }

    local fileformat = {
        "fileformat",
        icons_enabled = false,
    }

    local mode = {
        "mode",
        fmt = function(str)
            return str:sub(1,1)
        end,
    }

    lualine.setup({
        options = {
            icons_enabled = true,
            theme = "powerline",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
            always_divide_middle = true,
        },
        sections = {
            lualine_a = { mode },
            lualine_b = { branch },
            lualine_c = { filename },
            lualine_x = { "encoding", fileformat, filetype },
            lualine_y = { location },
            lualine_z = { "progress" },
        },
        inactive_sections = {
            lualine_a = { filename },
            lualine_b = {},
            lualine_c = {},
            lualine_x = { location },
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {},
        extensions = {},
    })
end

-- }}}

-- MeanderingProgrammer/render-markdown.nvim {{{
local render_markdown_ok, render_markdown = pcall(require, "render-markdown")
if render_markdown_ok then
    render_markdown.setup({
        file_types = { "markdown", "Avante" },
    })
end
-- }}}

-- }}}


-- HakonHarnes/img-clip.nvim - img_clip {{{
local img_clip_ok, img_clip = pcall(require, "img-clip")
if img_clip_ok then
    img_clip.setup({
        default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
                insert_mode = true,
            },
            use_absolute_path = true,
        },
    })
end
-- }}}


-- github.com/copilot.vim - copilot.vim {{{
vim.g.copilot_no_tab_map = false
vim.g.copilot_filetypes = { ["*"] = true }
-- }}}

-- folke/which-key.nvim -- which-key {{{
local which_key_ok, which_key = pcall(require, "which-key")
if which_key_ok then
    which_key.setup ({
        delay = 300,  -- 延迟显示
        plugins = {
            marks = true, -- shows a list of your marks on " in NORMAL or ' in VISUAL mode
            registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            spelling = {
                enabled = true, -- enabling this will show WhichKey when pressing z= to spell check
                suggestions = 20, -- how many suggestions should be shown in the list?
            },
        },
        show_help = true, -- 显示帮助信息
        presets = {
            operators = false,     -- 禁用操作符（如 `d`、`y`、`c` 等）的提示
            motions = false,      -- 禁用移动（如 `hjkl`、`w`、`b` 等）的提示
            text_objects = false, -- 禁用文本对象（如 `aw`、`as`、`ap` 等）的提示
            windows = false,      -- 禁用窗口管理（如 `<C-w>`）的提示
            nav = false,          -- 禁用导航（如 `]]`、`[m` 等）的提示
            z = false,           -- 禁用 `z` 开头的折叠相关提示
            g = false,           -- 禁用 `g` 开头的提示
        },
    })
    which_key.add({
        { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer Local Keymaps (which-key)" },
        { "<leader>f", group = "file/find" },
        { "<leader>g", group = "git/goto" },
        { "<leader>c", group = "code/config" },
    })
end
-- }}}

