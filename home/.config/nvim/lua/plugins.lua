return {
    "nvim-lua/plenary.nvim",
    "windwp/nvim-autopairs",
    "akinsho/bufferline.nvim",
    "nvim-lualine/lualine.nvim",
    "yubo/vim-log-highlighting",
    "goolord/alpha-nvim",
    "majutsushi/tagbar",
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
    "zivyangll/git-blame.vim",
    { "lewis6991/gitsigns.nvim", config = function() require("gitsigns").setup() end },
    "sindrets/diffview.nvim",

    -- ui
    "rebelot/kanagawa.nvim",
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-telescope/telescope-ui-select.nvim" } },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
    "ahmedkhalf/project.nvim",

    -- LSP
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
{ "folke/trouble.nvim", dependencies = "nvim-tree/nvim-web-devicons" },

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
    { "kevinhwang91/nvim-bqf", ft = "qf" },

    -- find/search
    { "folke/flash.nvim", event = "BufEnter" },
    { "folke/which-key.nvim", event = "BufEnter" },

    -- github copilot
    "github/copilot.vim",

    "folke/todo-comments.nvim",

    -- markdown
    { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "Avante" } },

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
