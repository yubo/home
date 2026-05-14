vim.cmd [[
  augroup _general_settings
    autocmd!
    " q 键关闭 quickfix/help/man/lspinfo 窗口
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    " 复制后短暂高亮
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
    " 禁止自动插入注释前缀
    autocmd BufWinEnter * :set formatoptions-=cro
    " quickfix 不显示在 buffer 列表
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    " 终端窗口大小变化时，均分所有分割窗口
    autocmd VimResized * tabdo wincmd =
  augroup end

  augroup _alpha
    autocmd!
    " Alpha 启动页打开时隐藏 tabline，退出后恢复
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end
]]

-- 保存前 LSP 格式化
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})

-- 恢复上次光标位置（替代 vim-lastplace）
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        if mark[1] > 1 and mark[1] <= vim.api.nvim_buf_line_count(0) then
            vim.api.nvim_win_set_cursor(0, mark)
        end
    end,
})
