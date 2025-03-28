local opt = vim.opt

opt.backup = false                          -- creates a backup file
opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
opt.cmdheight = 2                           -- more space in the neovim command line for displaying messages
opt.completeopt = { "menu", "menuone", "noselect" } -- mostly just for cmp
opt.conceallevel = 0                        -- so that `` is visible in markdown files
opt.fileencoding = "utf-8"                  -- the encoding written to a file
opt.hlsearch = true                         -- highlight all matches on previous search pattern
opt.ignorecase = true                       -- ignore case in search patterns
opt.mouse = ""                              -- allow the mouse to be used in neovim
opt.pumheight = 10                          -- pop up menu height
opt.showmode = true                         -- we don't need to see things like -- INSERT -- anymore
opt.showtabline = 2                         -- always show tabs
opt.smartcase = true                        -- smart case
opt.smartindent = true                      -- make indenting smarter again
opt.splitbelow = true                       -- force all horizontal splits to go below current window
opt.splitright = true                       -- force all vertical splits to go to the right of current window
opt.swapfile = false                        -- creates a swapfile
opt.termguicolors = true                    -- set term gui colors (most terminals support this)
opt.timeoutlen = 300                        -- time to wait for a mapped sequence to complete (in milliseconds)
opt.undofile = true                         -- enable persistent undo
opt.updatetime = 300                        -- faster completion (4000ms default)
opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
opt.expandtab = false                       -- convert tabs to spaces
--opt.shiftwidth = 8                        -- the number of spaces inserted for each indentation
--opt.tabstop = 2                           -- insert 2 spaces for a tab
opt.cursorline = true                       -- highlight the current line
opt.cursorcolumn = true                     -- highlight the current column
opt.number = true                           -- set numbered lines
opt.relativenumber = true                   -- set relative numbered lines
opt.numberwidth = 4                         -- set number column width to 2 {default 4}

opt.signcolumn = "yes"                      -- always show the sign column otherwise it would shift the text each time
opt.wrap = true                             -- display lines as one long line
opt.linebreak = true                        -- companion to wrap don't split words
opt.scrolloff = 8                           -- minimal number of screen lines to keep above and below the cursor
opt.sidescrolloff = 8                       -- minimal number of screen columns either side of cursor if wrap is `false`
opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications
opt.whichwrap = "bs<>[]hl"                  -- which "horizontal" keys are allowed to travel to prev/next line
opt.foldmethod = "marker"                   -- 代码折叠 za zM zR 


-- vim.opt.shortmess = "ilmnrx"                    -- flags to shorten vim messages, see :help 'shortmess'
opt.shortmess:append "c"                           -- don't give |ins-completion-menu| messages
opt.iskeyword:append "-"                           -- hyphenated words recognized by searches
opt.formatoptions:remove({ "c", "r", "o" })        -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
opt.runtimepath:remove("/usr/share/vim/vimfiles")  -- separate vim plugins from neovim in case vim still in use

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
