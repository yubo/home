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

-- 保存前自动 organize imports（Go 等语言）
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function(ev)
        local clients = vim.lsp.get_clients({ bufnr = ev.buf, name = "gopls" })
        if #clients == 0 then return end
        local client = clients[1]
        local params = vim.lsp.util.make_range_params(0, client.offset_encoding)
        params.context = { only = { "source.organizeImports" } }
        local result = vim.lsp.buf_request_sync(ev.buf, "textDocument/codeAction", params, 3000)
        for _, res in pairs(result or {}) do
            for _, r in pairs(res.result or {}) do
                if r.edit then
                    vim.lsp.util.apply_workspace_edit(r.edit, client.offset_encoding)
                elseif r.command then
                    vim.lsp.buf.execute_command(r.command)
                end
            end
        end
    end,
})

-- 保存前 LSP 格式化（仅当存在支持格式化的 client，避免 pyright 等无格式化能力时报错）
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function(ev)
        local clients = vim.lsp.get_clients({ bufnr = ev.buf })
        for _, client in ipairs(clients) do
            if client:supports_method("textDocument/formatting") then
                vim.lsp.buf.format({ async = false, bufnr = ev.buf })
                return
            end
        end
    end,
})

-- 切回 nvim 时检测文件是否被外部修改
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
    command = "checktime",
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

-- 文件补全会为目录追加 "/"；若光标右侧原本已有 "/"，删除重复的一个。
vim.api.nvim_create_autocmd("CompleteDone", {
    callback = function()
        local completed_word = vim.v.completed_item.word or ""
        if completed_word:sub(-1) ~= "/" then
            return
        end

        local line = vim.api.nvim_get_current_line()
        local col = vim.api.nvim_win_get_cursor(0)[2]
        if line:sub(col, col + 1) == "//" then
            vim.api.nvim_set_current_line(line:sub(1, col) .. line:sub(col + 2))
        end
    end,
})
