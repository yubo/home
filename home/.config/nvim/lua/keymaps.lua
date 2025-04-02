local opts = function(desc)
    return { desc = desc, noremap = true, silent = true }
end

-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
--keymap("", ",", "<Nop>", opts("leader"))
vim.g.mapleader = ","                           -- set leader to space
vim.g.maplocalleader = ","                      -- set local leader to space

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


-- Custome --
function _G.ReloadConfig()
    require("plenary.reload").reload_module("user")
    dofile(vim.env.MYVIMRC)
end

--keymap("",  "<c-f>",           "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>", {})
--keymap("",  "<c-b>",           "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>", {})
keymap("n", "#",               "<cmd>let @/=printf('\\<%s\\>\\C', expand('<cword>'))<cr>", opts("search word"))

keymap("n", "<c-l>",           "<cmd>bn<cr>", opts("next buffer"))
keymap("n", "<c-h>",           "<cmd>bp<cr>", opts("previous buffer"))
keymap("n", "<c-n>",           "<cmd>cn<cr>", opts("next quickfix"))
keymap("n", "<c-p>",           "<cmd>cp<cr>", opts("previous quickfix"))
keymap("n", "<c-j>",           "7<c-e>", opts("scroll down"))
keymap("n", "<c-k>",           "7<c-y>", opts("scroll up"))
keymap("n", "<c-e>",           "<cmd>m+1<cr>", opts("move down"))
keymap("n", "<c-y>",           "<cmd>m-2<cr>", opts("move up"))
-- telescope
-- keymap("n", "<leader>fh",      "<cmd>Telescope help_tags<cr>", opts("help tags"))

keymap("n", "<leader><Space>", "<cmd>NvimTreeFindFileToggle<cr>", opts("nvim tree"))
keymap("i", "<c-a>",           "<home>", opts("beginning of line"))
keymap("i", "<c-e>",           "<end>", opts("end of line"))
keymap("i", "<c-b>",           "<left>", opts("left"))
keymap("i", "<c-f>",           "<right>", opts("right"))
keymap("i", "<c-j>",           "<down>", opts("down"))
keymap("i", "<c-k>",           "<up>", opts("up"))
keymap("i", "<c-d>",           "<del>", opts("delete"))
keymap("c", "<c-a>",           "<home>", opts("beginning of line"))
keymap("c", "<c-e>",           "<end>", opts("end of line"))
keymap("c", "<c-b>",           "<left>", opts("left"))
keymap("c", "<c-f>",           "<right>", opts("right"))
keymap("c", "<c-j>",           "<down>", opts("down"))
keymap("c", "<c-k>",           "<up>", opts("up"))
keymap("c", "<c-d>",           "<del>", opts("delete"))

-- Resize with arrows
keymap("n", "<C-Up>", "<cmd>resize -2<cr>", opts("resize up"))
keymap("n", "<C-Down>", "<cmd>resize +2<cr>", opts("resize down"))
keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", opts("resize left"))
keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", opts("resize right"))

-- Move text up and down
keymap("n", "<A-j>", "<esc>:m .+1<cr>==gi", opts("move down"))
keymap("n", "<A-k>", "<esc>:m .-2<cr>==gi", opts("move up"))

-- Insert --
-- Press jk fast to exit insert mode 
keymap("i", "jk", "<esc>", opts("exit insert mode"))
keymap("i", "kj", "<esc>", opts("exit insert mode"))

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts("indent left"))
keymap("v", ">", ">gv", opts("indent right"))

-- Move text up and down
keymap("v", "<c-n>", "<cmd>m .+1<cr>==", opts("move down"))
keymap("v", "<c-p>", "<cmd>m .-2<cr>==", opts("move up"))
keymap("v", "p", '"_dP', opts("paste over"))

-- Visual Block --
-- Move text up and down
keymap("x", "<c-p>", "<cmd>move '<-2<cr>gv-gv", opts("move up"))
keymap("x", "<c-n>", "<cmd>move '>+1<cr>gv-gv", opts("move down"))


-- flash
keymap({"n", "x", "o"}, "s", function() require("flash").jump({search={mode="search"}}) end, opts("flash jump"))
keymap({"n", "x", "o"}, "S", function() require("flash").treesitter() end, opts("Flash Treesitter"))

-- c: code/config/git
--keymap("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", opts("Symbols (Trouble)"))
--keymap("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", opts("LSP Definitions / references / ... (Trouble)"))
keymap("n", "<leader>cx", "<cmd>Trouble diagnostics toggle<cr>", opts("Diagnostics (Trouble)"))
keymap("n", "<leader>cb", ":<C-u>call gitblame#echo()<cr>", opts("Git blame"))
keymap("n", "<leader>cr", "<cmd>lua ReloadConfig()<cr>", opts("Reload config (nvim)"))
keymap("n", "<leader>cm", "<cmd>set mouse=a<cr>", opts("Mouse on"))
keymap("n", "<leader>cM", "<cmd>set mouse=<cr>", opts("Mouse off"))
keymap("n", "<leader>ct", "<cmd>TagbarToggle <cr>", opts("Tagbar"))

-- g: git
keymap("n", "<leader>gs", "<cmd>Git<cr>", opts("Git status"))
keymap("n", "<leader>gb", "<cmd>Git blame<cr>", opts("Git blame"))
keymap("n", "<leader>gd", ":Gvdiffsplit<CR>", opts("Git diff"))
keymap("n", "<leader>gh", ":DiffviewFileHistory %<CR>", opts("Git file history"))
keymap("n", "<leader>gH", ":DiffviewFileHistory<CR>", opts("Git branch history"))
keymap("n", "<leader>gv", function()
    -- 检查 Diffview 是否已经打开
    local view = require('diffview.lib').get_current_view()
    if view then
        vim.cmd('DiffviewClose')
    else
        vim.cmd('DiffviewOpen')
    end
end, opts("Toggle Diffview"))

-- f: file/find
keymap("n", "<leader>fp", "<cmd>Telescope projects<cr>", opts("Find projects"))
keymap("n", "<leader>pp", "<cmd>ProjectRoot<cr>", opts("Project root"))
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts("Find files"))
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts("Live grep"))
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts("Buffers"))
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts("Help tags"))

-- t: test 
keymap("n", "<leader>tt", "<cmd>lua require('neotest').run.run()<cr>", opts("Test"))
keymap("n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", opts("Test file"))
keymap("n", "<leader>to", "<cmd>lua require('neotest').output.open({ enter = false, float = true })<cr>", opts("Test output"))
keymap("n", "<leader>tl", "<cmd>lua require('neotest').summary.toggle()<cr>", opts("Test summary"))
keymap("n", "<leader>td", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", opts("Test dap"))
keymap("n", "<leader>tp", "<cmd>lua require('neotest').output_panel.toggle()<cr>", opts("Test panel"))

-- d: debug
-- https://code.visualstudio.com/docs/editor/debugging#_debug-actions
keymap("n", "<leader>dt", function() require('dap-go').debug_test() end, opts("Debug test"))
keymap("n", "<leader>dl", function() require('dap').run_last() end, opts("Debug last"))
keymap("n", "<leader>dB", function() require('dap').set_breakpoint(nil, nil, vim.fn.input("log point message: ")) end, opts("Debug log point"))
keymap("n", "<leader>db", function() require('dap').toggle_breakpoint() end, opts("Debug breakpoint"))
keymap("n", "<leader>dk", function() require('dapui').eval() end, opts("Debug eval"))
keymap("n", "<leader>df", function() require('dapui').float_element() end, opts("Debug float"))
keymap("n", "<f1>",       function() require('dap-go').debug_test() end, opts("Debug test"))
keymap("n", "<f2>",       function() require('dapui').toggle() end, opts("Debug UI"))
keymap("n", "<f5>",       function() require('dap').continue() end, opts("Debug continue"))
keymap("n", "<f6>",       function() require('dap').step_over() end, opts("Debug step over"))
keymap("n", "<f7>",       function() require('dap').step_into() end, opts("Debug step into"))
keymap("n", "<f8>",       function() require('dap').step_out() end, opts("Debug step out"))
keymap("n", "<f9>",       function() require('dap').up() end, opts("Debug up"))
keymap("n", "<s-f9>",     function() require('dap').down() end, opts("Debug down"))
keymap("n", "<s-f5>",     function() require('dap').terminate() end, opts("Debug terminate"))
keymap("n", "<cs-f5>",    function() require('dap').restart() end, opts("Debug restart"))

-- other
-- windows
keymap("n", "<space>h", "<c-w>h", opts("Go to the left window"))
keymap("n", "<space>j", "<c-w>j", opts("Go to the down window"))
keymap("n", "<space>k", "<c-w>k", opts("Go to the up window"))
keymap("n", "<space>l", "<c-w>l", opts("Go to the right window"))
keymap("n", "<space>l", "<c-w>t", opts("Go to the top window"))
keymap("n", "<space>-", "<cmd>split<cr>", opts("split"))
keymap("n", "<space>|", "<cmd>vsplit<cr>", opts("vsplit"))
keymap("n", "<space>=", "gg=G", opts("format"))
keymap("n", "<space>e", vim.lsp.buf.rename, opts("lsp: Rename"))
keymap("n", "<space>q", "<cmd>bprevious<cr>:bdelete #<cr>", opts("delete buffer"))
keymap("n", "<space>;", "<cmd>noh<cr>", opts("clear search"))
keymap("n", "<space>f", "<cmd>Telescope find_files<cr>", opts("find files"))
keymap("n", "<space>g", "<cmd>Telescope live_grep<cr>", opts("live grep"))
keymap("n", "<space>b", "<cmd>Telescope buffers<cr>", opts("buffers"))
keymap("n", "]c", "<cmd>Gitsigns next_hunk<CR>", opts("git: Next hunk") )
keymap("n", "[c", "<cmd>Gitsigns prev_hunk<CR>", opts("git: Pre hunk"))
