-- Automatically install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = vim.fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don"t error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Install your plugins here
return packer.startup(function(use)
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/plenary.nvim"  -- Useful lua functions used by lots of plugins
    use "windwp/nvim-autopairs"  -- Autopairs, integrates with both cmp and treesitter
    use "numToStr/Comment.nvim"
    use "akinsho/bufferline.nvim"
    use "moll/vim-bbye"
    use "nvim-lualine/lualine.nvim"
    use "lewis6991/impatient.nvim"
    use "yubo/vim-log-highlighting"
    use "goolord/alpha-nvim"
    use "farmergreg/vim-lastplace"
    use "majutsushi/tagbar"
    use "nvim-treesitter/nvim-treesitter" -- Treesitter

    -- git
    use 'tpope/vim-fugitive'
    use { 'lewis6991/gitsigns.nvim', config = function() require('gitsigns').setup() end }
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    -- ui
    use "rebelot/kanagawa.nvim" -- colorscheme
    use {"nvim-telescope/telescope.nvim", requires = {"nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim"}}
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use { "nvim-tree/nvim-tree.lua", requires = {"nvim-tree/nvim-web-devicons"} }
    use { "ahmedkhalf/project.nvim", requires = {"nvim-telescope/telescope.nvim"} }

    -- Cmp 
    use "hrsh7th/nvim-cmp"          -- The completion plugin
    use "hrsh7th/cmp-buffer"        -- buffer completions
    use "hrsh7th/cmp-path"          -- path completions
    use "hrsh7th/cmp-cmdline"       -- cmdline completions
    use "saadparwaiz1/cmp_luasnip"  -- snippet completions
    use "L3MON4D3/LuaSnip"          -- snippet engine
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"

    -- {{{ LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/mason.nvim" -- simple to use language server installer
    use "williamboman/mason-lspconfig.nvim"
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
    use "RRethy/vim-illuminate"
    use "fatih/vim-go"

    -- lsp ui 增强 
    use "nvimdev/lspsaga.nvim"
    use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }
    -- }}}

    -- {{{ debug, test
    use "mfussenegger/nvim-dap"
    use "rcarriga/nvim-dap-ui"
    use "leoluz/nvim-dap-go" -- golang
    use "nvim-neotest/nvim-nio"
    use "theHamsta/nvim-dap-virtual-text"
    use "nvim-telescope/telescope-dap.nvim"

    use {
        "nvim-neotest/neotest",
        requires = {
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/nvim-nio",
            "nvim-neotest/neotest-go", -- golang
            "nvim-lua/plenary.nvim", -- lua
        }
    }
    -- }}}

    -- quickfix
    use { "kevinhwang91/nvim-bqf", ft = "qf" }

    -- 任务管理
    -- use { "stevearc/overseer.nvim", config = function() require("overseer").setup() end }

    -- find/search
    use { "folke/flash.nvim", event = "BufEnter" }

    use { "folke/which-key.nvim", requires = { "echasnovski/mini.nvim" }, event = "BufEnter" }

    -- github copilot
    use "github/copilot.vim"

    -- avante, a Neovim plugin designed to emulate the behaviour of the Cursor AI IDE
    -- https://github.com/yetone/avante.nvim?tab=readme-ov-file#installation
    use {
        "yetone/avante.nvim",
        branch = "main",
        run = "make",
        requires = {
            -- Required plugins
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "MeanderingProgrammer/render-markdown.nvim",
            -- Optional dependencies
            "hrsh7th/nvim-cmp",
            "nvim-tree/nvim-web-devicons",
            "HakonHarnes/img-clip.nvim",
            "zbirenbaum/copilot.lua",
        },
    }

    use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" }


    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
