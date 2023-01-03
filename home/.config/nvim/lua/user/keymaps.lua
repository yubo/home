local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ','
vim.g.maplocalleader = ','

function _G.ReloadConfig()
	require("plenary.reload").reload_module("user")
	dofile(vim.env.MYVIMRC)
end

keymap("", "<c-f>",  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>", {})
keymap("", "<c-b>",  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>", {})

keymap("n", "<c-l>",  ':bn<CR>', opts)
keymap("n", "<c-h>",  ':bp<CR>', opts)
keymap("n", "<c-n>",  ':cn<CR>', opts)
keymap("n", "<c-p>",  ':cp<CR>', opts)
keymap("n", "<c-j>",  '7<c-e>', opts)
keymap("n", "<c-k>",  '7<c-y>', opts)
keymap("n", "<c-x>",  ':%!xxd<CR>', opts)
keymap("n", "<c-xx>", ':%!xxd -r<CR>', opts)


keymap("n", "<leader>b",       ":Telescope buffers<CR>", opts)
keymap("n", "<leader>h",       "<c-w>h", opts)
keymap("n", "<leader>j",       "<c-w>j", opts)
keymap("n", "<leader>k",       "<c-w>k", opts)
keymap("n", "<leader>l",       "<c-w>l", opts)
keymap("n", "<leader>s",       "<c-u>call gitblame#echo()<CR>", opts)
keymap("n", "<leader>ss",      "<cmd>lua ReloadConfig()<CR>", opts)
keymap("n", "<leader>q",       ":bprevious<CR>:bdelete #<CR>", opts)
keymap("n", "<leader>g=",       "gg=G", opts)
keymap("n", "<leader>;",       ":noh<CR>", opts)
keymap("n", "<leader>p",       ":set paste<CR>", opts)
keymap("n", "<leader>pp",      ":set nopaste<CR>", opts)
keymap("n", "<leader>n",       ":set number<CR>", opts)
keymap("n", "<leader>nn",      ":set noNumber<CR>", opts)
keymap("n", "<leader>f",       ":Telescope find_files<CR>", opts)
keymap("n", "<leader><Space>", ":NvimTreeFindFileToggle<CR>", opts)

keymap("i", "<c-a>",  '<home>', opts)
keymap("i", "<c-e>",  '<end>', opts)
keymap("i", "<c-b>",  '<left', opts)
keymap("i", "<c-f>",  '<right>', opts)
keymap("i", "<c-j>",  '<down>', opts)
keymap("i", "<c-k>",  '<up>', opts)
keymap("i", "<c-d>",  '<del>', opts)

keymap("c", "<c-a>",  '<home>', opts)
keymap("c", "<c-e>",  '<end>', opts)
keymap("c", "<c-b>",  '<left', opts)
keymap("c", "<c-f>",  '<right>', opts)
keymap("c", "<c-j>",  '<down>', opts)
keymap("c", "<c-k>",  '<up>', opts)
keymap("c", "<c-d>",  '<del>', opts)



-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to exit insert mode 
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<c-n>", ":m .+1<CR>==", opts)
keymap("v", "<c-p>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "<c-n>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<c-p>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

