if exists("b:did_ftplugin")
	finish
endif


nmap <Leader>s  <Plug>(go-implements)
nmap <Leader>i  <Plug>(go-info)
nmap <Leader>gd <Plug>(go-doc)
nmap <Leader>gv <Plug>(go-doc-vertical)
nmap <Leader>gb <Plug>(go-doc-browser)
nmap <leader>rr <Plug>(go-run)
nmap <leader>b  <Plug>(go-build)
nmap <leader>tt <Plug>(go-test)
nmap <leader>c  <Plug>(go-coverage)
nmap <Leader>ds <Plug>(go-def-split)
nmap <Leader>dv <Plug>(go-def-vertical)
nmap <Leader>dt <Plug>(go-def-tab)
nmap <Leader>e  <Plug>(go-rename)

nmap <C-]>	:GoDef<CR>
nmap <C-g>   <C-w>l:silent! hide<CR>:vs<CR>:GoDef<CR><C-w>h
"nmap <C-g>   :PreGo<CR>
