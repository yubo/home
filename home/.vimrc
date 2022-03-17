" options {{{

set dir=$HOME/.vim/tmp/swap
if !isdirectory(&dir) | call mkdir(&dir, 'p', 0700) | endif

" tab替换为4空格 %retab! 
"set ts=8
"set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
"set tabstop=8 softtabstop=8 shiftwidth=8
set guifont=Inconsolata\ XL:h17,Inconsolata:h20,Monaco:h17
set nocompatible
set nolinebreak nowrap
set autoindent smartindent
set autoread
set backspace=indent,eol,start
set completefunc=
set cursorcolumn cursorline

" 中文支持
set fencs=utf-8,chinese,latin1 fenc=utf-8 enc=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set fileformats=unix
set encoding=utf-8
set scrolloff=2
set fenc=utf-8
set formatoptions=mnoqt
" gVim will load `$VIM/vimrc` before loading `~/.vimrc`,
" add `finish` at the beginning of `$VIM/vimrc` to hide `Menu`,
" because `$VIM/vimrc` calls `syntax on` which will build menu!
set guioptions+=aM guioptions-=T
set guitablabel=(%N)\ %t\ %M
set hidden
set history=50
set hlsearch incsearch
set ignorecase smartcase "忽略大小写
"set noignorecase
set isfname-== isfname-=,
"set listchars=precedes:«,extends:»,tab:>-,trail:-
set listchars=trail:«
"set list
set modeline
set mouse=
set number numberwidth=4 showbreak=\ \ ->
set number numberwidth=4
set nonumber
set laststatus=2

set path=.,/usr/local/include/*,/usr/include/**1
set ruler
set showcmd
set showmatch matchpairs+=<:> matchtime=2
set sidescroll=1 sidescrolloff=1
set spelllang=en
set splitright splitbelow
set tabpagemax=50
set tags=./tags;/,~/.vim/tags
set thesaurus=~/.vim/tsr.txt
set timeoutlen=500 ttimeoutlen=0
set titlestring=%F\ %M
set virtualedit=block
set wrapscan
set wildignore=*.swp,*.bak,*.pyc,*~
"set wildignorecase
set wildmenu
"代码折叠
"za zM zR
set foldmethod=marker
"filetype off
"打开高亮
syntax enable
""syntax on
"显示行号
"set number
set modelines=0
set autoindent
set hidden
set ttyfast
set ttymouse=xterm
set scroll=11
"自动换行
set wrap
"禁止自动换行
"set nowrap
"将-连接符也设置为单词
set isk+=-
"设置大小写敏感
set ignorecase
set smartcase
"set gdefault
set incsearch
set hlsearch
"行号自动跳转
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
				\| exe "normal! g'\"" | endif
endif

filetype plugin indent on
hi SpecialKey ctermfg=238

" sw   shiftwidth
" ts   tabstop
" et   expandtab
" sts  softtabstop
" st   smarttab
au BufRead,BufNewFile *.ts,*.tsx   setfiletype typescript
au BufRead,BufNewFile *.js,*.jsx   setfiletype javascript
au BufRead,BufNewFile *.css,*.less setfiletype css
au BufRead,BufNewFile *.yaml,*.yml setfiletype yaml
au BufRead,BufNewFile *.go         setfiletype go
au BufRead,BufNewFile go.mod       setfiletype gomod
au BufRead,BufNewFile *.vue        setfiletype html
au BufRead,BufNewFile *.txt        setfiletype text
au BufRead,BufNewFile *.jsonnet    setfiletype jsonnet
au BufRead,BufNewFile *.md         setfiletype markdown

au FileType html       setlocal et sta sw=4 sts=4
au FileType css        setlocal et sta sw=2 sts=2
au FileType json       setlocal et sta sw=4 sts=4
au FileType javascript setlocal et sta sw=2 sts=2
au FileType typescript setlocal et sta sw=2 sts=2
au FileType yaml       setlocal et sta sw=2 sts=2

"au BufRead,BufNewFile *.asm,*.c,*.cpp,*.java,*.cs,*.sh,*.lua,*.pl,*.pm,*.py,*.rb,*.hs,*.vim,*.go 2match Underlined /.\%>81v.*/
"}}}

" mappings {{{
let mapleader=','
" normal mode
nnoremap Y                        y$
nnoremap #                        :let @/=printf('\<%s\>\C', expand('<cword>'))<CR>
nnoremap <c-l>                    :bn<CR>
nnoremap <c-h>                    :bp<CR>
nnoremap <c-n>                    :cn<CR>
nnoremap <c-p>                    :cp<CR>
nnoremap <c-j>                    7<C-e>
nnoremap <c-k>                    7<C-y>
nnoremap <leader>c                :cclose<CR>
nnoremap <leader>o                :copen<CR>
nnoremap <leader>x                : %!xxd<CR>
nnoremap <leader>xx               : %!xxd -r<CR>
nnoremap <leader>b                : BufExplorer<CR>
nnoremap <leader>h                <c-w>h
nnoremap <leader>j                <c-w>j
nnoremap <leader>k                <c-w>k
nnoremap <leader>l                <c-w>l
nnoremap <leader>s                :so $MYVIMRC<CR>
nnoremap <leader>t                :TagbarToggle<CR>
nnoremap <leader>q                :bdelete<CR>
nnoremap <leader>g=                gg=G
nnoremap <leader>z                :setl fdm=indent fdc=1 fdn=1<CR>
nnoremap <leader>;                :noh<CR>
nnoremap <leader>p                :set paste<CR>
nnoremap <leader>pp               :set nopaste<CR>
nnoremap <silent><leader><space>  :NERDTreeToggle<CR>
nnoremap <silent><leader>n        :set number<CR>
nnoremap <silent><leader>nn       :set nonumber<CR>
nnoremap <silent>fm               :LspDocumentFormat<cr>
nnoremap <silent>md               :Goyo 120x70%<CR>
"diff
nnoremap <leader>u                :diffupdate<CR>
"insert mode
inoremap <leader>co            // Copyright <c-r>=strftime('%Y')<CR> yubo. All rights reserved.<CR>// Use of this source code is governed by a BSD-style<CR>// license that can be found in the LICENSE file.<CR>
" current file name"
inoremap <expr> <leader>fn     expand('%:p')
" date "
inoremap <leader>dt            <c-r>=strftime('%Y-%m-%d')<CR>
" time "
inoremap <leader>tm            <c-r>=strftime('%H:%M:%S')<CR>
"inoremap <c-space>             <c-x><c-u>
inoremap <c-a>                 <home>
inoremap <c-e>                 <end>
inoremap <c-b>                 <left>
inoremap <c-f>                 <right>
inoremap <c-n>                 <down>
inoremap <c-p>                 <up>
inoremap <c-d>                 <del>
inoremap {{                    {{}}<Esc>hi
inoremap {{{                   {{{}}}<Esc>2hi

"command mode
cnoremap <c-a>                 <home>
cnoremap <c-e>                 <end>
cnoremap <c-b>                 <left>
cnoremap <c-f>                 <right>
cnoremap <c-p>                 <up>
cnoremap <c-n>                 <down>
cnoremap <c-d>                 <del>

"visual mode
vnoremap <c-m>                 !markdown<CR>
vnoremap <c-p>                 !pandoc<CR>
vnoremap <c-f>                 !figlet<CR>

" others
cnoreabb <expr> W              getcmdtype()==':'&&getcmdline()=~#'^W'?'w':'W'
"}}}

" plugins {{{
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'jlanzarotta/bufexplorer'

"markdown"
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'junegunn/limelight.vim', { 'for': 'markdown' }


"scripts
" cs"'		'hello'		-> "hello"
" cs'<p>	'hello'		-> <p>hello</p>
" cst"		<p>hello</p>	-> "hello"
" ds"		"hello"		-> hello
Plug 'tpope/vim-surround'

"theme
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"<leader>tt 格式化表格
Plug 'Stormherz/tablify'
"<c-o> zoomwin"
Plug 'vim-scripts/ZoomWin'
" The gtags.vim plugin script integrates the GNU GLOBAL source code tag system
" with Vim. About the details, see http://www.gnu.org/software/global/.
Plug 'vim-scripts/gtags.vim'
"vim-gitgutter: A Vim plugin which shows a git diff in the sign column. "
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/EasyMotion'
Plug 'vim-scripts/AutoClose'

"complete"
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'wellle/tmux-complete.vim'

"lsp - Language Server Protocol"
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'

"jsonnet"
Plug 'google/vim-jsonnet', { 'for': 'jsonnet' }

" golang"
Plug 'govim/govim', { 'branch': 'main', 'for': 'go' }

call plug#end()

" {{{ lsp
let g:lsp_settings = {
    \  'golangci-lint-langserver': {
    \    'disabled': 1
    \   }
    \}

let g:lsp_semantic_enabled = 1
let g:lsp_diagnostics_enabled = 0
let g:lsp_document_highlight_enabled = 0

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
"}}}


" {{{ 自动补全
let g:tmuxcomplete#asyncomplete_source_options = {
    \ 'name':      'tmuxcomplete',
    \ 'whitelist': ['*'],
    \ 'config': {
    \     'splitmode':      'words',
    \     'filter_prefix':   1,
    \     'show_incomplete': 1,
    \     'sort_candidates': 0,
    \     'scrollback':      0,
    \     'truncate':        0
    \     }
    \ }

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'allowlist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

" }}}

" scheme {{{

"vim-airline 
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" or copy paste the following into your vimrc for shortform text
let g:airline_mode_map = {
			\ '__' : '-',
			\ 'n'  : 'N',
			\ 'i'  : 'I',
			\ 'R'  : 'R',
			\ 'c'  : 'C',
			\ 'v'  : 'V',
			\ 'V'  : 'V',
			\ '' : 'V',
			\ 's'  : 'S',
			\ 'S'  : 'S',
			\ '' : 'S',
			\ }
let g:airline#extensions#default#layout = [
			\ [ 'a', 'b', 'c' ],
			\ [ 'x', 'y', 'z' ]
			\ ]
"let g:airline_section_c = '%t'
"let g:airline_section_x = '%{strlen(&ft) ? &ft : "Noft"}%{&bomb ? " BOM" : ""}'
let g:airline_section_y = '%{&fileformat} %{(&fenc == "" ? &enc : &fenc)}'
let g:airline_section_z = '%2l:%-1v/%L'

"color 
set t_Co=256
syntax enable
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized

"plugins color"
hi	VertSplit	ctermfg=244 ctermbg=232   cterm=bold
hi	TagbarSignature	ctermfg=37
"hi	OverLength	ctermbg=red ctermfg=white guibg=#592929 
"match	OverLength	/\%81v.\+/
"}}}


" Generic {{{
"cscope"
set cscopequickfix=s-,c-,d-,i-,t-,e-

""
"gtags"
let Gtags_OpenQuickfixWindow = 0

"EasyMotion"
let g:EasyMotion_mapping_b = '<c-b>'
let g:EasyMotion_mapping_w = '<c-f>'

" NERDTree
let NERDChristmasTree=1
let NERDTreeWinPos='left'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore = ['\.pyc', '\.mod\.c', '\.o', '\.ko', '\.a', '\.so', 'CMakeFiles', 'CMakeCache.txt', 'GPATH', 'GRTAGS', 'GTAGS']

"自动补全 complete
" 回车替换 c-y
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
let g:asyncomplete_min_chars = 1
"let g:asyncomplete_auto_popup = 0
"
"function! s:check_back_space() abort
"    let col = col('.') - 1
"    return !col || getline('.')[col - 1]  =~ '\s'
"endfunction
"
"inoremap <silent><expr> <TAB>
"  \ pumvisible() ? "\<C-n>" :
"  \ <SID>check_back_space() ? "\<TAB>" :
"  \ asyncomplete#force_refresh()
"inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() : "\<cr>"


""augroup complete
""autocmd!
""  autocmd CompleteDone * pclose
""augroup end

"markdown"
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"for local vimrc
if filereadable(expand("./.vim_local"))
    source ./.vim_local
endif

"}}} 
