if exists("b:did_ftplugin")
    finish
endif
nmap <C-]> :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <C-g>   <C-w>l:silent! hide<CR>:vs<CR>:Gtags<CR><CR><C-w>h
set equalprg=indent\ -npro\ -kr\ -i8\ -ts8\ -sob\ -l80\ -ss\ -ncs\ -cp1\ -il0
