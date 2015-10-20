if exists("b:did_ftplugin")
    finish
endif
nmap <C-]>   :Gtags<CR><CR>
"nmap <C-g>   :PreC<CR>
nmap <C-g>   <C-w>l:silent! hide<CR>:vs<CR>:Gtags<CR><CR><C-w>h
