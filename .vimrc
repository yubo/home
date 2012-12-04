" options {{{
" If `$VIM/vimrc` didn't `set cp`, we don't need to `set nocp` here.
" Please read the manual!
" 不显示标签页
"set showtabline=0
" tab替换为4空格 %retab! 
set ts=4
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set guifont=Inconsolata\ XL:h17,Inconsolata:h20,Monaco:h17
set nocompatible
set nolinebreak nowrap nocursorline
set autoindent smartindent
set autoread
set backspace=indent,eol,start
set cedit=<C-x>
set clipboard=unnamedplus
"set colorcolumn=100
set completefunc=
"set cryptmethod=blowfish
"set dictionary=/usr/lib/firefox/dictionaries/en_US.dic
" 中文支持
set fencs=utf-8,chinese,latin1 fenc=utf-8 enc=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set fileformats=unix
set encoding=utf-8
set scrolloff=3
set fenc=utf-8
set foldnestmax=2
set formatoptions=mnoqt
" gVim will load `$VIM/vimrc` before loading `~/.vimrc`,
" add `finish` at the beginning of `$VIM/vimrc` to hide `Menu`,
" because `$VIM/vimrc` calls `syntax on` which will build menu!
set guioptions+=aM guioptions-=T
set guitablabel=(%N)\ %t\ %M
set hidden
set history=50
set hlsearch incsearch
set ignorecase smartcase
set isfname-== isfname-=,
set listchars=precedes:«,extends:»,tab:>-,trail:∙,eol:$
set modeline
set mouse=a
set number numberwidth=4 showbreak=->
set laststatus=2

set path=.,/usr/local/include/*,/usr/include/**1
set ruler
set selectmode=key keymodel=startsel
set showcmd
set showmatch matchpairs+=<:> matchtime=2
set sidescroll=1 sidescrolloff=1
set spelllang=en
set splitright splitbelow
set tabpagemax=50
set tabstop=8 softtabstop=4 shiftwidth=4 expandtab
set tags=./tags;/,~/.vim/tags
set thesaurus=~/.vim/tsr.txt
set timeoutlen=500 ttimeoutlen=0
set titlestring=%F\ %M
"set undofile
set virtualedit=block
set wrapscan
set wildignore=*.swp,*.bak,*.pyc,*~
"set wildignorecase
set wildmenu
"代码折叠
"set foldmethod=indent
filetype off
filetype plugin indent on
set t_Co=256
"打开高亮
syntax enable
"使用color solarized
colorscheme solarized
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
if has('gui_running')
    set background=light
else
    set background=dark
endif
set modelines=0
set autoindent
set hidden
"设置光标高亮显示
"set cursorline
"set cursorcolumn
set ttyfast
"相对行号 要想相对行号起作用要放在显示行号后面
"set relativenumber
"显示行号
"set number
"无限undo
"7.3功能
" Enable modelines only on secure vim versions
if (v:version >= 703)
    set undofile
else
endif
"自动换行
set wrap
"禁止自动换行
"set nowrap
"自动载入配置文件不需要重启
"autocmd! bufwritepost _vimrc source %
"将-连接符也设置为单词
set isk+=-
"设置大小写敏感和聪明感知(小写全搜，大写完全匹配)
set ignorecase
set smartcase
"set gdefault
set incsearch
set showmatch
set hlsearch
"}}}


" plugins {{{
"call pathogen#infect()
let g:fencview_autodetect=1

"支持单行和多行的选择，//格式
"let g:Powerline_symbols = 'unicode'
let g:Powerline_symbols = 'fancy'
let g:Powerline_cache_enabled = 1
let g:showmarks_enable = 0
let g:showmarks_include = "abcdefghijklmnopqrstuvwxyz".
                        \ "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
let g:showmarks_textlower = " "
let g:showmarks_textupper = " "
let g:showmarks_textother = " "
let g:showmarks_hlline_lower = 1
let g:showmarks_hlline_upper = 1
let g:showmarks_hlline_other = 1

let g:ctrlp_dotfiles = 0
let g:ctrlp_max_depth = 30
let g:ctrlp_max_height = 25
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_prompt_mappings = { 'MarkToOpen()': ['<C-z>', '<C-space', '<C-@>'] }
let g:ctrlp_custom_ignore = {
                            \ 'dir':  '\.git$\|\.hg$\|\.svn$',
                            \ 'file': '\.pdf$\|\.epub$\|\.mobi$\|\.djvu$\|\.chm$\|'.
                                    \ '\.mp[34]$\|\.og[gva]$\|\.flv$\|\.avi$\|\.mov$\|\.swf$\|'.
                                    \ '\.jpe\?g$\|\.png$\|\.gif$\|'.
                                    \ '\.zip$\|\.bz2$\|\.gz$\|\.tar$\|\.7z$\|\.rar$',
                            \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
                            \}
cnoremap <C-o>     :CtrlPMRUFiles<CR>
cnoremap <C-@>     :CtrlPMRUFiles<CR>

let g:solarized_menu = 0


let g:alternateExtensions_html = 'md,markdown'
let g:alternateExtensions_md = 'html'
let g:alternateExtensions_markdown = 'html'
let g:alternateExtensions_coffee = 'js'
let g:alternateExtensions_js = 'coffee'

let g:SuperTabMappingBackward = '<C-p>'
let g:SuperTabMappingForward = '<C-n>'
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabContextDefaultCompletionType = '<C-n>'
aug SuperTab
    au!
    au FileType *   call BindSuperTab()
aug END
fun! BindSuperTab()
    let g:SuperTabMappingForward = '<C-n>'
    if index(['css'], &ft)!=-1
        let tab = '<C-x><C-o>'
    elseif index(['javascript', 'python', 'text'], &ft)!=-1
        let tab = 'context'
    elseif index(['html'], &ft)!=-1
        let g:SuperTabMappingForward = '<C-random>'  "SPARKUP/SNIPMATE
        let tab = '<C-p>'
    else
        let tab = '<C-n>'
    endif
    let g:SuperTabDefaultCompletionType = tab
endfun


let g:neocomplcache_enable_at_startup = 1
"set cscopequickfix=s-,c-,d-,i-,t-,e-
if has("cscope")
"    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
     if filereadable("cscope.out")
     cs add cscope.out
    " else add database pointed to by environment
     elseif $CSCOPE_DB != ""
     cs add $CSCOPE_DB
     endif
     set csverb
     set cscopetag
    " set cscopequickfix=s-,g-,c-,d-,t-,e-,f-,i-
endif
"NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"}}}



" mappings {{{
let mapleader = ','
" normal mode
nnoremap Y               y$
nnoremap *               : let @/=printf('\<%s\>\c', expand('<cword>'))<CR>
nnoremap #               : let @/=printf('\<%s\>\C', expand('<cword>'))<CR>
nnoremap <expr> gm         float2nr(strdisplaywidth(getline('.'))/2+1) . "\<BAR>"
nnoremap <F5>            : noh \| redraw!<CR>
nnoremap <C-b>           : buffers<CR>
nnoremap <C-l>           gt
nnoremap <C-h>           gT
nnoremap <C-j>           <C-e>
nnoremap <C-k>           <C-y>
nnoremap <leader>y       : YRShow<CR>
nnoremap <leader>u       : GundoToggle \| wincmd l<CR>
nnoremap <leader>w         <C-w>
nnoremap <leader>h       : wincmd h<CR>
nnoremap <leader>j       : wincmd j<CR>
nnoremap <leader>k       : wincmd k<CR>
nnoremap <leader>l       : wincmd l<CR>
nnoremap <leader>p       : wincmd p<CR>
nnoremap <leader>s       : so $MYVIMRC<CR>
nnoremap <leader>v       : tabe $MYVIMRC<CR>
nnoremap <leader>t       : Tlist<CR>
nnoremap <leader>o       : tabo<CR>
nnoremap <leader>q       : q<CR>
nnoremap <leader>f       : !firefox %<CR>
nnoremap <leader>z       : setl fdm=indent fdc=1 fdn=1<CR>
nnoremap <leader>;       : noh<CR>
nnoremap <leader><space> : NERDTreeToggle<CR>
nnoremap <leader><enter> : NERDTreeToggle<CR>
" insert mode
inoremap <leader>co        YUBO<yubo@yubo.org>
inoremap <expr> <leader>fn     expand('%:p')
inoremap <leader>dt      <C-r>=strftime('%Y-%m-%d')<CR>
inoremap <leader>tm      <C-r>=strftime('%H:%M:%S')<CR>
"inoremap <C-@>           <C-x><C-u>
"inoremap <C-space>       <C-x><C-u>
inoremap <C-a>           <home>
inoremap <C-e>           <end>
inoremap <C-b>           <left>
inoremap <C-f>           <right>
"inoremap <A-b>           <S-left>
"inoremap <A-f>           <S-right>
inoremap <C-d>           <del>
inoremap <A-d>           <C-o>dw
" command mode
cnoremap <C-a>           <home>
cnoremap <C-e>           <end>
cnoremap <C-b>           <left>
cnoremap <C-f>           <right>
"cnoremap <leader>b       <S-left>
"cnoremap <leader>f       <S-right>
"cnoremap <leader>d       <S-right><C-w>
cnoremap <C-d>           <delete>
cnoremap <C-p>           <up>
cnoremap <C-n>           <down>
" visual mode
vnoremap <C-m>           !markdown<CR>
vnoremap <C-p>           !pandoc<CR>
vnoremap <C-f>           !figlet<CR>
" others
cnoreabb <expr> W        getcmdtype()==':'&&getcmdline()=~#'^W'?'w':'W'
"esc的映射
"imap jj <esc>
"使用tab键来代替%进行匹配跳转
nnoremap <tab> %
vnoremap <tab> %
"折叠html标签 ,fold tag
nnoremap <leader>ft vatzf
"搜索替换
"nmap <leader>s :,s///c


"取消粘贴缩进
nmap <leader>p :set paste<CR>
nmap <leader>pp :set nopaste<CR>
"文件类型切换
"nmap <leader>fj :set ft=javascript<CR>
"nmap <leader>fc :set ft=css<CR>
"nmap <leader>fx :set ft=xml<CR>
"nmap <leader>fm :set ft=mako<CR>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>
inoremap <C-h> <left>


"}}}






"===================================================
" vim 插件管理 
" git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
filetype off        " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
" vim-scripts repos
"Bundle 'vim-plugin-foo'
"Bundle 'vim-plugin-bar'
Bundle 'ctrlp.vim'
Bundle 'AutoClose'
Bundle 'ZenCoding.vim'
Bundle 'matchit.zip'
Bundle 'ShowTrailingWhitespace'
Bundle '_jsbeautify'
Bundle 'EasyMotion'
Bundle 'FencView.vim'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'snipMate'
Bundle 'bufexplorer.zip'
"Bundle 'minibufexpl.vim'
Bundle 'taglist.vim'
Bundle 'OmniCppComplete'
Bundle 'cscope.vim'
Bundle 'https://github.com/Lokaltog/vim-powerline.git'
Bundle 'https://github.com/Shougo/neocomplcache.git'
Bundle 'https://github.com/spiiph/vim-space'

filetype plugin indent on    " required!

