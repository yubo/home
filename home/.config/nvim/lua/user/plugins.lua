local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
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

-- Use a protected call so we don't error out on first use
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
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"
    use "akinsho/bufferline.nvim"
    use "moll/vim-bbye"
    use "nvim-lualine/lualine.nvim"
    use "akinsho/toggleterm.nvim"
    use "ahmedkhalf/project.nvim"
    use "lewis6991/impatient.nvim"
    use "yubo/vim-log-highlighting"
    use "goolord/alpha-nvim"
    use "farmergreg/vim-lastplace"
    use "zivyangll/git-blame.vim"
    use "rebelot/kanagawa.nvim" -- Colorschemes
    use "majutsushi/tagbar"
    use "nvim-treesitter/nvim-treesitter" -- Treesitter

    use "nvim-telescope/telescope.nvim" -- Telescope
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

    -- Cmp 
    use "hrsh7th/nvim-cmp"          -- The completion plugin
    use "hrsh7th/cmp-buffer"        -- buffer completions
    use "hrsh7th/cmp-path"          -- path completions
    use "hrsh7th/cmp-cmdline"       -- cmdline completions
    use "saadparwaiz1/cmp_luasnip"  -- snippet completions
    use "L3MON4D3/LuaSnip"          -- snippet engine
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"

    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/mason.nvim" -- simple to use language server installer
    use "williamboman/mason-lspconfig.nvim"
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
    use "RRethy/vim-illuminate"
    use "fatih/vim-go"

    -- debug
    use "mfussenegger/nvim-dap"
    use "rcarriga/nvim-dap-ui"
    use "leoluz/nvim-dap-go" -- golang
    use "nvim-neotest/nvim-nio"
    use "theHamsta/nvim-dap-virtual-text"
    use "nvim-telescope/telescope-dap.nvim"

    use {
        "nvim-neotest/neotest",
        cmd = { "Neotest" },
        config = function()
            require("neotest").setup({
                consumers = {
                    overseer = require("neotest.consumers.overseer"),
                },
                overseer = {
                    enabled = true,
                    -- When this is true (the default), it will replace all neotest.run.* commands
                    force_default = false,
                },
            })
        end,
        requires = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter"
        }
    }


    use { "kevinhwang91/nvim-bqf", ft = 'qf', config = function() require("bqf").setup() end } -- quickfix
    use { "stevearc/overseer.nvim", config = function() require('overseer').setup() end }

    -- you can configure Hop the way you like here; see :h hop-config
    use { "phaazon/hop.nvim", branch = 'v2', config = function() require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' } end }

    use { "junegunn/fzf", run = function() vim.fn['fzf#install']() end }

    -- github copilot
    use "github/copilot.vim"

    -- avante, a Neovim plugin designed to emulate the behaviour of the Cursor AI IDE
    -- https://github.com/yetone/avante.nvim?tab=readme-ov-file#installation
    use {
      'yetone/avante.nvim',
      branch = 'main',
      run = 'make',
      requires = {
         -- Required plugins
        'stevearc/dressing.nvim',
        'nvim-lua/plenary.nvim',
        'MunifTanjim/nui.nvim',
        'MeanderingProgrammer/render-markdown.nvim',
         -- Optional dependencies
        'hrsh7th/nvim-cmp',
        'nvim-tree/nvim-web-devicons',
        'HakonHarnes/img-clip.nvim',
        'zbirenbaum/copilot.lua',
      },
    }



    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
