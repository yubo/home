vim.opt.backup = false                          -- creates a backup file
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2                           -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.mouse = ""                              -- allow the mouse to be used in neovim
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.showmode = true                         -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2                         -- always show tabs
vim.opt.smartcase = true                        -- smart case
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 300                        -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.updatetime = 300                        -- faster completion (4000ms default)
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
vim.opt.expandtab = false                       -- convert tabs to spaces
--vim.opt.shiftwidth = 8                        -- the number of spaces inserted for each indentation
--vim.opt.tabstop = 2                           -- insert 2 spaces for a tab
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.cursorcolumn = true                     -- highlight the current column
vim.opt.number = true                           -- set numbered lines
vim.opt.relativenumber = true                   -- set relative numbered lines
vim.opt.numberwidth = 4                         -- set number column width to 2 {default 4}

vim.opt.signcolumn = "yes"                      -- always show the sign column otherwise it would shift the text each time
vim.opt.wrap = true                             -- display lines as one long line
vim.opt.linebreak = true                        -- companion to wrap don't split words
vim.opt.scrolloff = 8                           -- minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 8                       -- minimal number of screen columns either side of cursor if wrap is `false`
vim.opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications
vim.opt.whichwrap = "bs<>[]hl"                  -- which "horizontal" keys are allowed to travel to prev/next line
vim.opt.foldmethod = "marker"                   -- 代码折叠 za zM zR 


-- vim.opt.shortmess = "ilmnrx"                 -- flags to shorten vim messages, see :help 'shortmess'
vim.opt.shortmess:append "c"                           -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append "-"                           -- hyphenated words recognized by searches
vim.opt.formatoptions:remove({ "c", "r", "o" })        -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")  -- separate vim plugins from neovim in case vim still in use
vim.opt.termguicolors = true                    -- enable 24-bit RGB color in the TUI


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
