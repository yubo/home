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
"GUI界面里的字体，默认有抗锯齿
""set guifont=Inconsolata:h12
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
set dictionary=/usr/lib/firefox/dictionaries/en_US.dic
" 中文支持
set fencs=utf-8,chinese,latin1 fenc=utf-8 enc=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set fileformats=unix
set encoding=utf-8
set scrolloff=3
set fenc=utf-8
set foldnestmax=2
" don't auto wrap long text
"set formatoptions=mnoq
" mbyte/list-header support when <gq>
set formatoptions+=mn
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
set laststatus=2
set listchars=precedes:«,extends:»,tab:▸―,trail:∙,eol:¶
set number numberwidth=4 showbreak=\ \ \ ↳ cpo+=n
set modeline
set mouse=a
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
""set undofile
set virtualedit=block
set wrapscan
set wildignore=*.swp,*.bak,*.pyc,*~
"set wildignorecase
set wildmenu
set foldmethod=syntax
"必须的设置：
filetype off
filetype plugin indent on
"打开高亮
syntax enable
"不要兼容vi
set nocompatible
"使用color solarized
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized
"terminal下面的背景问题
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
set modelines=0
"一些其他的设定
set autoindent
set hidden
"设置光标高亮显示
"set cursorline
"set cursorcolumn
set ttyfast
set ruler
set backspace=indent,eol,start
"相对行号 要想相对行号起作用要放在显示行号后面
""set relativenumber
"显示行号
"set number
"无限undo
"set undofile
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
"加入html标签配对
"runtime macros/matchit.vim 
"以下设置用来是vim正确显示过长的行
"set textwidth=80
"set formatoptions=qrnl
"彩色显示第85行
"set colorcolumn=85
"设置256色显示
set t_Co=256
"行号栏的宽度
set numberwidth=4
"初始窗口的宽度
"set columns=135
"初始窗口的高度
"set lines=50
"初始窗口的位置
"设置隐藏gvim的菜单和工具栏 F2切换
set guioptions-=m
set guioptions-=T
"去除左右两边的滚动条
set go-=r
set go-=L
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

winpos 620 45 
"}}}




" plugins {{{
"call pathogen#infect()

"nnoremap <leader>_ff :call g:Jsbeautify()<CR> 
let g:EasyMotion_leader_key = '<Leader><Leader>' 
let g:fencview_autodetect=1
""nmap <leader>nt :NERDTree<cr>:set rnu<cr>
""let NERDTreeShowBookmarks=1
""let NERDTreeShowFiles=1
""let NERDTreeShowHidden=1
""let NERDTreeIgnore=['\.$','\~$']
""let NERDTreeShowLineNumbers=1
""let NERDTreeWinPos=1
""let NERDShutUp=1
"支持单行和多行的选择，//格式
"map <c-h> ,c<space>


let g:Powerline_symbols = 'unicode'
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
cnoremap <C-space> :CtrlPMRUFiles<CR>
cnoremap <C-@>     :CtrlPMRUFiles<CR>

let g:CommandTCancelMap = '<esc>'
cnoremap <C-t>     :CommandT<CR>

let g:Powerline_symbols = 'fancy'

let g:solarized_menu = 0

let g:yankring_default_menu_mode = 0
nnoremap <leader>y :YRShow<CR>

nnoremap <leader>u :GundoToggle \| wincmd l<CR>

let g:alternateExtensions_html = 'md,markdown'
let g:alternateExtensions_md = 'html'
let g:alternateExtensions_markdown = 'html'
let g:alternateExtensions_coffee = 'js'
let g:alternateExtensions_js = 'coffee'

let g:vimwiki_list = [
                        \{
                            \'template_path': '~/vimwiki/templates/',
                            \'template_ext': '.html',
                            \'template_default': 'default',
                            \'nested_syntaxes': {'python': 'python', 'bash': 'sh'}
                        \},
                        \{
                            \'path': '~/github/hjkl/_posts/',
                            \'syntax': 'markdown', 'ext': '.md'
                        \}
                    \]
let g:vimwiki_menu = 0
let g:vimwiki_folding = 0
let g:vimwiki_auto_checkbox = 1
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_CJK_length = 1
let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr,table,tr,td'
let g:vimwiki_html_header_numbering = 1
let g:vimwiki_html_header_numbering_sym = '.'
"let g:vimwiki_listsyms = ' ¼½¾✓'

let g:SuperTabMappingBackward = '<C-p'
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
    set csprg=/usr/bin/cscope
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

"}}}


" mappings {{{
let mapleader = ','
" normal mode
nnoremap Y               y$
nnoremap *               : let @/=printf('\<%s\>\c', expand('<cword>'))<CR>
nnoremap #               : let @/=printf('\<%s\>\C', expand('<cword>'))<CR>
nnoremap <expr> gm         float2nr(strdisplaywidth(getline('.'))/2+1) . "\<BAR>"
nnoremap <F5>            : noh \| redraw!<CR>
nnoremap <C-l>           gt
nnoremap <C-h>           gT
nnoremap <C-j>           <C-e>
nnoremap <C-k>           <C-y>
nnoremap <leader>w       <C-w>
nnoremap <leader>h       : wincmd h<CR>
nnoremap <leader>j       : wincmd j<CR>
nnoremap <leader>k       : wincmd k<CR>
nnoremap <leader>l       : wincmd l<CR>
nnoremap <leader>p       : wincmd p<CR>
nnoremap <leader>s       : so $MYVIMRC<CR>
nnoremap <leader>v       : tabe $MYVIMRC<CR>
nnoremap <leader>t       : tabe<CR>
nnoremap <leader>o       : tabo<CR>
nnoremap <leader>q       : q<CR>
nnoremap <leader>f       : !firefox %<CR>
nnoremap <leader>z       : setl fdm=indent fdc=1 fdn=1<CR>
nnoremap <leader>;       : noh<CR>
nnoremap <leader><space> : NERDTreeToggle<CR>
nnoremap <leader><enter> : NERDTreeToggle<CR>
" insert mode
inoremap <leader>co      © Kev++ <http://hjkl.me>
inoremap <expr> <leader>fn     expand('%:p')
inoremap <leader>dt      <C-r>=strftime('%Y-%m-%d')<CR>
inoremap <leader>tm      <C-r>=strftime('%H:%M:%S')<CR>
inoremap <C-t>           <esc>!!toilet -f future<CR>
inoremap <C-@>           <C-x><C-u>
inoremap <C-space>       <C-x><C-u>
inoremap <C-a>           <home>
inoremap <C-e>           <end>
inoremap <C-b>           <left>
inoremap <C-f>           <right>
inoremap <A-b>           <S-left>
inoremap <A-f>           <S-right>
inoremap <C-d>           <del>
inoremap <A-d>           <C-o>dw
" command mode
cnoremap <C-a>           <home>
cnoremap <C-e>           <end>
cnoremap <C-b>           <left>
cnoremap <C-f>           <right>
cnoremap <leader>b       <S-left>
cnoremap <leader>f       <S-right>
cnoremap <leader>d       <S-right><C-w>
cnoremap <C-d>           <delete>
cnoremap <C-p>           <up>
cnoremap <C-n>           <down>
" visual mode
vnoremap <C-m>           !markdown<CR>
vnoremap <C-p>           !pandoc<CR>
vnoremap <C-f>           !figlet<CR>
vnoremap <C-t>           !toilet -f future<CR>
" others
cnoreabb <expr> W        getcmdtype()==':'&&getcmdline()=~#'^W'?'w':'W'
"esc的映射
"imap jj <esc>
"屏蔽掉讨厌的F1键
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
"修改vim的正则表达
""nnoremap / /\v
""vnoremap / /\v
"使用tab键来代替%进行匹配跳转
nnoremap <tab> %
vnoremap <tab> %
"折叠html标签 ,fold tag
nnoremap <leader>ft vatzf
"使用,v来选择刚刚复制的段落，这样可以用来缩进
nnoremap <leader>v v`]
"使用,w来垂直分割窗口，这样可以同时查看多个文件,如果想水平分割则<c-w>s
"nnoremap <leader>w <c-w>v<c-w>l
"nnoremap <leader>wc <c-w>c
"nnoremap <leader>ww <c-w>w
"使用<leader>t来控制Tab的切换
""nnoremap <leader>t gt
""nnoremap <leader>r gT
"使用<leader>空格来取消搜索高亮
""nnoremap <leader><space> :noh<cr>
"html中的js加注释 取消注释
"nmap <leader>h I//jj
"nmap <leader>ch ^xx
"切换到当前目录
"nmap <leader>q :execute "cd" expand("%:h")<CR>
""搜索替换
"nmap <leader>s :,s///c


"取消粘贴缩进
nmap <leader>p :set paste<CR>
nmap <leader>pp :set nopaste<CR>
"文件类型切换
"nmap <leader>fj :set ft=javascript<CR>
"nmap <leader>fc :set ft=css<CR>
"nmap <leader>fx :set ft=xml<CR>
"nmap <leader>fm :set ft=mako<CR>
"匹配括号的规则，增加针对html的<>

"set matchpairs=(:),{:},[:],<:>
"让退格，空格，上下箭头遇到行首行尾时自动移到下一行（包括insert模式）
"set whichwrap=b,s,<,>,[,]
"插入模式下移动
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>
inoremap <c-h> <left>


"}}}






"===================================================
" vim 插件管理 
" git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
set nocompatible    " be iMproved
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
""Bundle 'minibufexpl.vim'
Bundle 'taglist.vim'
Bundle 'OmniCppComplete'
Bundle 'https://github.com/Lokaltog/vim-powerline.git'


filetype plugin indent on    " required!


