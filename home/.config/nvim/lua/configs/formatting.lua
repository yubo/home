-- 保存与手动格式化共用的规则；Go/Python 继续使用现有 LSP。
return {
    default_format_opts = {
        lsp_format = "fallback",
        timeout_ms = 2000,
    },
    formatters_by_ft = {
        go = { lsp_format = "prefer", name = "gopls" },
        gomod = { lsp_format = "prefer", name = "gopls" },
        gowork = { lsp_format = "prefer", name = "gopls" },
        gotmpl = { lsp_format = "prefer", name = "gopls" },
        python = { lsp_format = "prefer", name = "ruff" },
        lua = { "stylua" },
        javascript = { "biome", "prettier", stop_after_first = true },
        javascriptreact = { "biome", "prettier", stop_after_first = true },
        typescript = { "biome", "prettier", stop_after_first = true },
        typescriptreact = { "biome", "prettier", stop_after_first = true },
        json = { "biome", "prettier", stop_after_first = true },
        jsonc = { "biome", "prettier", stop_after_first = true },
        yaml = { "prettier" },
    },
    formatters = {
        -- Biome 仅在找到项目配置时参与选择；优先使用项目 node_modules 中的工具。
        biome = { require_cwd = true },
    },
}
