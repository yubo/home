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
local colors = require("kanagawa.colors").setup()

-- this will affect all the hl-groups where the redefined colors are used
local my_colors = {
    -- backgroud sumiInk1	Default background
    bg = "#000000", -- #1F1F28

    -- bg_dim = colors.sumiInk1b,
    -- bg_dim = "#ffffff",
    -- buffer bar bg_dark = colors.sumiInk0,
    bg_dark = "#262626",
    -- bottom bar bg_light0 = colors.sumiInk2,
    bg_light0 = "#262626",
    -- 光标背景 bg_light1 = colors.sumiInk3,
    bg_light1 = "#262626",
    -- 行号栏 bg_light2 = colors.sumiInk4,
    bg_light2 = "#585858",
    -- bg_light3 = colors.springViolet1,
    bg_light3 = "#8a8a8a",
    -- bg_status = colors.sumiInk0,
    bg_visual = "#262626";
    -- bg_search = "#101000",
    fg_border = "#8a8a8a",
    --fg_dark = "#ffffff",
    fg_reverse = "#8a8a8a",


    -- 注释 	fujiGray Comments
    fg_comment = "#585858", --  #727169
    -- 普通字符，变量名，包名等 fujiWhite		Default foreground
    fg = "#8a8a8a", -- #DCD7BA
    -- menu 字符 fujiWhite       Default foreground
    fg_menu = "#8a8a8a", -- #DCD7BA
    -- constants; csurimiOrange		Constants, imports, boolean
    co = "#7E9CD8", -- #FFA066
    -- string 	springGreen		Strings
    st = "#00afaf", -- #98BB6C
    -- number sakuraPink		Numbers
    nu = "#E6C384",   -- #D27E99
    -- field name id carpYellow	Identifiers
    id = "#8a8a8a", -- #E6C384
    -- fucntion  crystalBlue		Functions and Titles
    fn = "#bcbc8a", -- #7E9CD8
    -- if, switch,  oniViolet		Statements and Keywords
    sm = "#5f8700", -- #957FB8
    -- defer, keyword, koniViolet  Statements and Keyword
    kw = "#5f8700", -- #957FB8
    -- boatYellow2		Operators, RegEx
    op = "#C0A36E", -- #C0A36E
    -- surimiOrange		Constants, imports, booleans
    pp = "#5f8700", -- #FFA066
    -- type waveAqua2		Types
    ty = "#af8700", -- #7AA89F
    -- nil, make, len	Specials and builtin functions
    sp = "#0087ff", -- #7FB4CA
    -- waveRed	Standout specials 1 (builtin variables)
    sp2 = "#E46876", -- #E46876
    -- Standout specials 2 (exception handling, return)
    sp3 = "#5f8700", -- #FF5D62
    --  [(){},] springViolet2		Brackets and punctuation
    br = "#8a8a3a",   -- #9CABCA
    -- regex boatYellow2 Operators, RegEx
    re = "#C0A36E", -- #C0A36E
    -- katanaGray Deprecated
    dep = "#717C7C", -- #717C7C
}

local overrides = {
    Search = {fg="#262626", bg = "#af8700"},
}


require'kanagawa'.setup({ overrides = overrides, colors = my_colors })
vim.cmd("colorscheme kanagawa")
