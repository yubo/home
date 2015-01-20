" options {{{
" If `$VIM/vimrc` didn't `set cp`, we don't need to `set nocp` here.
" Please read the manual!
" 不显示标签页
"set showtabline=0
" tab替换为4空格 %retab! 
set ts=4
"set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
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
"set foldnestmax=2
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
"set listchars=precedes:«,extends:»,tab:>-,trail:-
set listchars=trail:«
"set list
set modeline
set mouse=a
set number numberwidth=4 showbreak=\ \ ->
set number numberwidth=4
set nonumber
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
"set foldmethod=indent
"filetype off
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
	"    set undofile
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
"行号自动跳转
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
				\| exe "normal! g'\"" | endif
endif
"}}}


" plugins {{{
"call pathogen#infect()
let g:fencview_autodetect=1

"支持单行和多行的选择，//格式
""let g:Powerline_symbols = 'unicode'
let g:Powerline_symbols = 'fancy'
""source ~/.vim/bundle/powerline/powerline/bindings/vim/source_plugin.vim

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
"cnoremap <C-o>     :CtrlPMRUFiles<CR>
"cnoremap <C-@>     :CtrlPMRUFiles<CR>

let g:solarized_menu = 0


let g:alternateExtensions_html = 'md,markdown'
let g:alternateExtensions_md = 'html'
let g:alternateExtensions_markdown = 'html'
let g:alternateExtensions_coffee = 'js'
let g:alternateExtensions_js = 'coffee'


let g:neocomplcache_enable_at_startup = 1
"NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"}}}



" mappings {{{
let mapleader = ','
" normal mode
nnoremap Y                     y$
nnoremap #                     : let @/=printf('\<%s\>\C', expand('<cword>'))<CR>
nnoremap <expr> gm               float2nr(strdisplaywidth(getline('.'))/2+1) . "\<BAR>"
nnoremap <F5>                  : noh \| redraw!<CR>
nnoremap <C-B>                 : MBEFocus<CR>
nnoremap <C-L>                 : bn<CR>
nnoremap <C-H>                 : bp<CR>
nnoremap <C-J>                 7<C-e>
nnoremap <C-K>                 7<C-y>
""nnoremap <leader>h             gT
""nnoremap <leader>l             gt
nnoremap <leader>r             :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ .<CR>
nnoremap <leader>b             : %!xxd<CR>
nnoremap <leader>bb            : %!xxd -r<CR>
nnoremap <leader>y             : YRShow<CR>
nnoremap <leader>h             <C-W>h
nnoremap <leader>j             <C-W>j
nnoremap <leader>k             <C-W>k
nnoremap <leader>l             <C-W>l
nnoremap <leader>s             : so $MYVIMRC<CR>
nnoremap <leader>v             : tabe $MYVIMRC<CR>
nnoremap <leader>t             : Tlist<CR>
nnoremap <leader>o             : tabo<CR>
nnoremap <leader>q             : Bdelete<CR>
nnoremap <leader>g             gg=G
nnoremap <leader>f             : !firefox %<CR>
nnoremap <leader>z             : setl fdm=indent fdc=1 fdn=1<CR>
nnoremap <leader>;             : noh<CR>
nnoremap <leader>p             : set paste<CR>
nnoremap <leader>pp            : set nopaste<CR>
nnoremap <silent><leader><space>       : NERDTreeToggle<CR>
nnoremap <silent><leader>n     : set number<CR>
nnoremap <leader>nn            : set nonumber<CR>
" diff "
nnoremap <leader>u             :diffupdate<CR>
" insert mode
inoremap <leader>co            YUBO<yubo@yubo.org>
inoremap <expr> <leader>fn     expand('%:p')
inoremap <leader>dt            <C-r>=strftime('%Y-%m-%d')<CR>
inoremap <leader>tm            <C-r>=strftime('%H:%M:%S')<CR>
"inoremap <C-@>                 <C-x><C-u>
"inoremap <C-space>             <C-x><C-u>
inoremap <C-a>                 <home>
inoremap <C-e>                 <end>
inoremap <C-b>                 <left>
inoremap <C-f>                 <right>
"inoremap <A-b>                 <S-left>
"inoremap <A-f>                 <S-right>
inoremap <C-d>                 <del>
inoremap <A-d>                 <C-o>dw
" command mode
cnoremap <C-a>                 <home>
cnoremap <C-e>                 <end>
cnoremap <C-b>                 <left>
cnoremap <C-f>                 <right>
"cnoremap <leader>b             <S-left>
"cnoremap <leader>f             <S-right>
"cnoremap <leader>d             <S-right><C-w>
cnoremap <C-d>                 <delete>
cnoremap <C-p>                 <up>
cnoremap <C-n>                 <down>
" visual mode
vnoremap <C-m>                 !markdown<CR>
vnoremap <C-p>                 !pandoc<CR>
vnoremap <C-f>                 !figlet<CR>
" others
cnoreabb <expr> W              getcmdtype()==':'&&getcmdline()=~#'^W'?'w':'W'
"esc的映射
"imap jj <esc>
"使用tab键来代替%进行匹配跳转
nnoremap <tab>                 %
vnoremap <tab>                 %

"文件类型切换
inoremap <C-j>                 <down>
inoremap <C-k>                 <up>

"use c-b c-f"
"inoremap <C-l>                 <right>  
"inoremap <C-h>                 <left>

"nmap <leader>fj               :set ft=javascript<CR>
"nmap <leader>fc               :set ft=css<CR>
"nmap <leader>fx               :set ft=xml<CR>
"nmap <leader>fm               :set ft=mako<CR>


"}}}


"for golang"
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)


"===================================================
" vim 插件管理 
" git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'AutoClose'
"Bundle 'ctrlp.vim'
Bundle 'EasyMotion'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'snipMate'
Bundle 'winmanager'
Bundle 'moll/vim-bbye'
Bundle 'wesleyche/SrcExpl'
Bundle 'https://github.com/bling/vim-airline.git'
Bundle 'https://github.com/Shougo/neocomplcache.git'
Bundle 'https://github.com/Stormherz/tablify.git'
Bundle 'https://github.com/vim-scripts/ZoomWin.git'
Bundle 'https://github.com/fatih/vim-go.git'


hi SpecialKey ctermfg=238
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

""""""""""""""""""""""""""""""
" winManager setting
""""""""""""""""""""""""""""""
let g:winManagerWindowLayout = "FileExplorer|TagList"
let g:winManagerWidth = 30
let g:defaultExplorer = 0
nmap <silent> <leader>wm :WMToggle<cr>

"NERD Tree
let NERDChristmasTree=1
let NERDTreeWinPos='right'

"Taglist"
let Tlist_Show_One_File = 1 " Displaying tags for only one file~
let Tlist_Exit_OnlyWindow = 1 " if you are the last, kill yourself

"omnicppcomplete"
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
	let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
set completeopt=longest,menu

let g:airline_powerline_fonts = 1
let g:airline_theme = 'badwolf'
let g:airline#extensions#tabline#enabled = 1


"cscope"
set cscopequickfix=s-,c-,d-,i-,t-,e-


"srcexpl"
" // The switch of the Source Explorer 
nnoremap <leader>se :SrcExplToggle<CR> 

" // Set the height of Source Explorer window 
let g:SrcExpl_winHeight = 8 

" // Set 100 ms for refreshing the Source Explorer 
let g:SrcExpl_refreshTime = 100 

" // Set "Enter" key to jump into the exact definition context 
let g:SrcExpl_jumpKey = "<ENTER>" 

" // Set "Space" key for back from the definition context 
let g:SrcExpl_gobackKey = "<SPACE>" 

" // In order to avoid conflicts, the Source Explorer should know what plugins
" // except itself are using buffers. And you need add their buffer names into
" // below listaccording to the command ":buffers!"
let g:SrcExpl_pluginList = [ 
        \ "__Tag_List__", 
        \ "_NERD_tree_" 
    \ ] 

" // Enable/Disable the local definition searching, and note that this is not 
" // guaranteed to work, the Source Explorer doesn't check the syntax for now. 
" // It only searches for a match with the keyword according to command 'gd' 
let g:SrcExpl_searchLocalDef = 1 

" // Do not let the Source Explorer update the tags file when opening 
let g:SrcExpl_isUpdateTags = 0 

" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to 
" // create/update the tags file 
""let g:SrcExpl_updateTagsCmd = "ctags -L cscope.files" 

" // Set "<F12>" key for updating the tags file artificially 
""let g:SrcExpl_updateTagsKey = "<leader>su" 

" // Set "<F3>" key for displaying the previous definition in the jump list 
let g:SrcExpl_prevDefKey = "<leader>sp" 

" // Set "<F4>" key for displaying the next definition in the jump list 
let g:SrcExpl_nextDefKey = "<leader>sn" 
