if exists("b:did_ftplugin")
	finish
endif

nmap <C-]> :YcmCompleter GoToDefinitionElseDeclaration<CR>
