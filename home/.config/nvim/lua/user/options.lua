local options = {
	backup = false,                          -- creates a backup file
	clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
	cmdheight = 2,                           -- more space in the neovim command line for displaying messages
	completeopt = { "menu", "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0,                        -- so that `` is visible in markdown files
	fileencoding = "utf-8",                  -- the encoding written to a file
	hlsearch = true,                         -- highlight all matches on previous search pattern
	ignorecase = true,                       -- ignore case in search patterns
	mouse = "",                              -- allow the mouse to be used in neovim
	pumheight = 10,                          -- pop up menu height
	showmode = true,                         -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2,                         -- always show tabs
	smartcase = true,                        -- smart case
	smartindent = true,                      -- make indenting smarter again
	splitbelow = true,                       -- force all horizontal splits to go below current window
	splitright = true,                       -- force all vertical splits to go to the right of current window
	swapfile = false,                        -- creates a swapfile
	termguicolors = true,                    -- set term gui colors (most terminals support this)
	timeoutlen = 300,                        -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true,                         -- enable persistent undo
	updatetime = 300,                        -- faster completion (4000ms default)
	writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = false,                       -- convert tabs to spaces
	--shiftwidth = 8,                        -- the number of spaces inserted for each indentation
	--tabstop = 2,                           -- insert 2 spaces for a tab
	cursorline = true,                       -- highlight the current line
	cursorcolumn = true,                     -- highlight the current column
	number = true,                           -- set numbered lines
	relativenumber = false,                  -- set relative numbered lines
	numberwidth = 4,                         -- set number column width to 2 {default 4}

	signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
	wrap = true,                             -- display lines as one long line
	linebreak = true,                        -- companion to wrap, don't split words
	scrolloff = 8,                           -- minimal number of screen lines to keep above and below the cursor
	sidescrolloff = 8,                       -- minimal number of screen columns either side of cursor if wrap is `false`
	guifont = "monospace:h17",               -- the font used in graphical neovim applications
	whichwrap = "bs<>[]hl",                  -- which "horizontal" keys are allowed to travel to prev/next line
	foldmethod = "marker",                   -- 代码折叠 za zM zR 
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- vim.opt.shortmess = "ilmnrx"                        -- flags to shorten vim messages, see :help 'shortmess'
vim.opt.shortmess:append "c"                           -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append "-"                           -- hyphenated words recognized by searches
vim.opt.formatoptions:remove({ "c", "r", "o" })        -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")  -- separate vim plugins from neovim in case vim still in use

vim.cmd([[
	au BufRead,BufNewFile go.mod             setfiletype gomod
	au BufRead,BufNewFile *.go               setfiletype go
	au BufRead,BufNewFile *.txt              setfiletype text
	au BufRead,BufNewFile *.jsonnet          setfiletype jsonnet
	au BufRead,BufNewFile *.ts,*.tsx         setfiletype typescript
	au BufRead,BufNewFile *.js,*.jsx         setfiletype javascript
	au BufRead,BufNewFile *.yaml,*.yml       setfiletype yaml
	au BufRead,BufNewFile *.wxml,*.vue       setfiletype html
	au BufRead,BufNewFile *.wxs,*.css,*.less setfiletype css

	au FileType html       setlocal et sta sw=4 sts=4
	au FileType css        setlocal et sta sw=2 sts=2
	au FileType json       setlocal et sta sw=4 sts=4
	au FileType javascript setlocal et sta sw=2 sts=2
	au FileType typescript setlocal et sta sw=2 sts=2
	au FileType yaml       setlocal et sta sw=2 sts=2
	au FileType xml        setlocal et sta sw=4 sts=4
]])
