return {
    "nvim-lua/plenary.nvim",
    "windwp/nvim-autopairs",
    {
        "kylechui/nvim-surround",
        version = "^4.0.0",
        event = "VeryLazy",
        init = function()
            -- 保留 Flash 的可视模式 S，包围符操作另用 gS。
            vim.g.nvim_surround_no_visual_mappings = true
        end,
        opts = {},
        config = function(_, opts)
            require("nvim-surround").setup(opts)
            vim.keymap.set("x", "gS", "<Plug>(nvim-surround-visual)", {
                desc = "Surround selection",
            })
        end,
    },
    "akinsho/bufferline.nvim",
    "nvim-lualine/lualine.nvim",
    "yubo/vim-log-highlighting",
    "goolord/alpha-nvim",
    {
        "stevearc/aerial.nvim",
        cmd = { "AerialToggle", "AerialOpen", "AerialClose", "AerialInfo" },
        opts = {
            backends = { "lsp", "treesitter", "markdown", "man" },
            layout = { default_direction = "right" },
        },
    },
    {
        "romus204/tree-sitter-manager.nvim",
        config = function()
            require("tree-sitter-manager").setup({
                ensure_installed = {
                    "go", "lua", "python", "bash", "c", "javascript", "json",
                    "typescript", "tsx", "rust", "yaml", "markdown", "markdown_inline",
                },
            })
        end,
    },

    -- git
    "tpope/vim-fugitive",
    { "lewis6991/gitsigns.nvim",                  config = function() require("gitsigns").setup() end },
    {
        "sindrets/diffview.nvim",
        opts = {
            keymaps = {
                view = {
                    { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } },
                    { "n", "<leader>q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } },
                },
                file_panel = {
                    { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } },
                    { "n", "<leader>q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } },
                },
                file_history_panel = {
                    { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } },
                    { "n", "<leader>q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } },
                },
            },
        },
    },

    -- ui
    "rebelot/kanagawa.nvim",
    { "nvim-telescope/telescope.nvim",            dependencies = { "nvim-telescope/telescope-ui-select.nvim" } },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-tree/nvim-tree.lua",                  dependencies = { "nvim-tree/nvim-web-devicons" } },
    "ahmedkhalf/project.nvim",

    -- LSP
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        cmd = "ConformInfo",
        opts = function()
            return require("configs.formatting")
        end,
    },
    { "folke/trouble.nvim",       dependencies = "nvim-tree/nvim-web-devicons" },

    -- debug, test (uncomment to enable)
    -- "mfussenegger/nvim-dap",
    -- "rcarriga/nvim-dap-ui",
    -- "leoluz/nvim-dap-go",
    -- "nvim-neotest/nvim-nio",
    -- "theHamsta/nvim-dap-virtual-text",
    -- "nvim-telescope/telescope-dap.nvim",
    -- {
    --     "nvim-neotest/neotest",
    --     dependencies = {
    --         "antoinemadec/FixCursorHold.nvim",
    --         "nvim-treesitter/nvim-treesitter",
    --         "nvim-neotest/nvim-nio",
    --         "nvim-neotest/neotest-go",
    --     },
    -- },

    -- quickfix
    { "kevinhwang91/nvim-bqf",    ft = "qf" },

    -- find/search
    {
        "folke/flash.nvim",
        event = "BufEnter",
        opts = {
            labels = "abcdefghijklmnopqrstuvwxyz",
            search = { mode = "fuzzy" },
            jump = { autojump = true },
        },
    },
    {
        "folke/which-key.nvim",
        event = "BufEnter",
        opts = {
            delay = 300,
            plugins = {
                marks = true,
                registers = true,
                spelling = { enabled = true, suggestions = 20 },
                presets = {
                    operators = false,
                    motions = false,
                    text_objects = false,
                    windows = false,
                    nav = false,
                    z = false,
                    g = false,
                },
            },
            show_help = true,
            spec = {
                { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer Local Keymaps (which-key)" },
                { "<leader>f", group = "file/find" },
                { "<leader>g", group = "git/goto" },
                { "<leader>h", group = "git hunks" },
                { "<leader>c", group = "code/config" },
            },
        },
    },

    -- github copilot
    "github/copilot.vim",

    "folke/todo-comments.nvim",

    -- markdown
    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "markdown", "Avante" },
        opts = { file_types = { "markdown", "Avante" } },
    },

    -- ai
    -- {
    --     "yetone/avante.nvim",
    --     build = "make",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "MunifTanjim/nui.nvim",
    --         "HakonHarnes/img-clip.nvim",
    --     },
    -- },
    "HakonHarnes/img-clip.nvim",
}
