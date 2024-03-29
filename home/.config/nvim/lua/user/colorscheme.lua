-- require'kanagawa'.setup({ overrides = overrides, colors = my_colors })
require'kanagawa'.setup()
vim.cmd("colorscheme kanagawa")

-- local status_ok, _ = pcall(vim.cmd, "colorscheme darkplus")
-- local status_ok, _ = pcall(vim.cmd, "colorscheme tokyonight-night")
-- if not status_ok then
--   return
-- end


-- require("github-theme").setup({
-- theme_style = "dark",
-- function_style = "italic",
-- sidebars = {"qf", "vista_kind", "terminal", "packer"},

-- -- Change the "hint" color to the "orange" color, and make the "error" color bright red
-- colors = {hint = "orange", error = "#ff0000"},

-- -- Overwrite the highlight groups
-- overrides = function(c)
--   return {
--     htmlTag = {fg = c.red, bg = "#282c34", sp = c.hint, style = "underline"},
--     DiagnosticHint = {link = "LspDiagnosticsDefaultHint"},
--     -- this will remove the highlight groups
--     TSField = {},
--   }
-- end
-- })

-- 
-- vim.opt.termguicolors = true
-- vim.opt.syntax = enable
-- vim.opt.background = "dark"
-- vim.g.solarized_termtrans = 1
-- vim.g.solarized_termcolors = 256
-- local colors = require("kanagawa.colors").setup()

-- this will affect all the hl-groups where the redefined colors are used
-- local my_colors = {
--     -- backgroud sumiInk1	Default background
--     bg = "#000000", -- #1F1F28
-- 
--     -- bg_dim = colors.sumiInk1b,
--     -- bg_dim = "#ffffff",
--     -- buffer bar bg_dark = colors.sumiInk0,
--     bg_dark = "#262626",
--     -- bottom bar bg_light0 = colors.sumiInk2,
--     bg_light0 = "#262626",
--     -- 光标背景 bg_light1 = colors.sumiInk3,
--     bg_light1 = "#262626",
--     -- 行号栏 bg_light2 = colors.sumiInk4,
--     bg_light2 = "#585858",
--     -- bg_light3 = colors.springViolet1,
--     bg_light3 = "#8a8a8a",
--     -- bg_status = colors.sumiInk0,
--     bg_visual = "#04395e";
--     -- bg_search = "#101000",
--     fg_border = "#8a8a8a",
--     --fg_dark = "#ffffff",
--     fg_reverse = "#8a8a8a",
-- 
-- 
--     -- 注释 	fujiGray Comments
--     fg_comment = "#585858", --  #727169
--     -- 普通字符，变量名，包名等 fujiWhite		Default foreground
--     fg = "#a4a4a4", -- #DCD7BA
--     -- menu 字符 fujiWhite       Default foreground
--     fg_menu = "#a4a4a4", -- #DCD7BA
--     -- Constants, imports, boolean e.g. constants, ture, imports
--     co = "#7E9Cb8", -- #FFA066
--     -- Strings
--     st = "#B27F69", -- #98BB6C
--     -- Numbers
--     nu = "#a5bE97",   -- #D27E99
--     -- Identifiers e.g. struct.field
--     id = "#a4a4a4", -- #E6C384
--     -- function  crystalBlue		Functions and Titles
--     -- fn = "#bfbf93", -- #7E9CD8
--     fn = "#a07b00", -- #7E9CD8
--     -- Statements and Keywords e.g. if, switch
--     sm = "#a566a0", -- #957FB8
--     -- type, const, defer, keyword
--     kw = "#559Cb6", -- #957FB8
--     -- Operators, RegEx
--     op = "#a0936E", -- #C0A36E
--     -- Constants, imports, booleans
--     pp = "#559Cb6", -- #FFA066
--     -- Types e.g. int, type xxx struct ...
--     ty = "#41aa95", -- #7AA89F
--     -- Specials and builtin functions, e.g. nil, make, len
--     sp = "#a07b00", -- #7FB4CA
--     -- waveRed	Standout specials 1 (builtin variables)
--     sp2 = "#a45866", -- #E46876
--     -- Standout specials 2 (exception handling, return)
--     sp3 = "#aa58a7", -- #FF5D62
--     --  Brackets and punctuation e.g. [, (, ), {, }, ]
--     br = "#a6a6a6",   -- #9CABCA
--     -- regex boatYellow2 Operators, RegEx
--     re = "#a0936E", -- #C0A36E
--     -- katanaGray Deprecated
--     dep = "#717C7C", -- #717C7C
-- }
-- 
-- local overrides = {
--     Search = {fg="#262626", bg = "#a07700"},
--     Directory = {fg="#559CD6"},
--     ["@variable"] = { fg = "#75a5bf" },
-- }



