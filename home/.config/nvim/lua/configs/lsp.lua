-- =========================================================
-- Neovim 0.11+ native LSP config
-- no require("lspconfig")
-- no none-ls
-- =========================================================

local function has_any_file(markers)
    local cwd = vim.uv.cwd()
    for _, marker in ipairs(markers) do
        local path = vim.fs.find(marker, {
            upward = true,
            path = cwd,
            stop = vim.loop.os_homedir(),
        })[1]
        if path then
            return true
        end
    end
    return false
end

local function build_lsp_ensure_installed()
    local list = {}
    local seen = {}

    local function add(items)
        for _, item in ipairs(items) do
            if not seen[item] then
                seen[item] = true
                table.insert(list, item)
            end
        end
    end

    add({ "lua_ls" })

    local rules = {
        { markers = { "go.mod", "go.work" }, servers = { "gopls" } },
        {
            markers = {
                "pyproject.toml",
                "setup.py",
                "setup.cfg",
                "requirements.txt",
                "Pipfile",
                "pyrightconfig.json",
            },
            servers = { "pyright" },
        },
        {
            markers = { "package.json", "tsconfig.json", "jsconfig.json" },
            servers = { "ts_ls", "jsonls" },
        },
        { markers = { "Cargo.toml", "rust-project.json" }, servers = { "rust_analyzer" } },
        { markers = { "compile_commands.json", "compile_flags.txt" }, servers = { "clangd" } },
        { markers = { ".bashrc", ".bash_profile", ".zshrc" }, servers = { "bashls" } },
    }

    for _, rule in ipairs(rules) do
        if has_any_file(rule.markers) then
            add(rule.servers)
        end
    end

    return list
end

local servers_to_enable = build_lsp_ensure_installed()

-- =========================================================
-- Mason
-- =========================================================
local ok_mason, mason = pcall(require, "mason")
if ok_mason then
    mason.setup()
end

local ok_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
if ok_mason_lspconfig then
    mason_lspconfig.setup({
        ensure_installed = servers_to_enable,
        automatic_installation = true,
    })
end

-- =========================================================
-- Capabilities
-- =========================================================
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if ok_cmp then
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

-- =========================================================
-- Diagnostics
-- =========================================================
vim.diagnostic.config({
    virtual_text = false,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
        },
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})

-- =========================================================
-- Shared on_attach
-- =========================================================
local disable_formatting_servers = {
    ts_ls = true,
}

local on_attach = function(client, bufnr)
    if disable_formatting_servers[client.name] then
        client.server_capabilities.documentFormattingProvider = false
    end

    vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

    local ok_illuminate, illuminate = pcall(require, "illuminate")
    if ok_illuminate then
        illuminate.on_attach(client)
    end
end

-- =========================================================
-- Server configs
-- root_dir marker functions直接用 vim.fs.root
-- =========================================================

vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_dir = function(bufnr, on_dir)
        local root = vim.fs.root(bufnr, {
            ".luarc.json",
            ".luarc.jsonc",
            ".luacheckrc",
            ".stylua.toml",
            "stylua.toml",
            "selene.toml",
            "selene.yml",
            ".git",
        })
        on_dir(root)
    end,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

vim.lsp.config("pyright", {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_dir = function(bufnr, on_dir)
        local root = vim.fs.root(bufnr, {
            "pyproject.toml",
            "setup.py",
            "setup.cfg",
            "requirements.txt",
            "Pipfile",
            "pyrightconfig.json",
            ".git",
        })
        on_dir(root)
    end,
    single_file_support = true,
})

vim.lsp.config("ts_ls", {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
    },
    root_dir = function(bufnr, on_dir)
        local root = vim.fs.root(bufnr, {
            "package.json",
            "tsconfig.json",
            "jsconfig.json",
            ".git",
        })
        on_dir(root)
    end,
    single_file_support = true,
})

vim.lsp.config("jsonls", {
    capabilities = capabilities,
    on_attach = on_attach,
})

vim.lsp.config("clangd", {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = function(bufnr, on_dir)
        local root = vim.fs.root(bufnr, {
            "compile_commands.json",
            "compile_flags.txt",
            ".git",
        })
        on_dir(root)
    end,
    single_file_support = true,
})

vim.lsp.config("rust_analyzer", {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_dir = function(bufnr, on_dir)
        local root = vim.fs.root(bufnr, {
            "Cargo.toml",
            "rust-project.json",
            ".git",
        })
        on_dir(root)
    end,
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
            },
            checkOnSave = {
                command = "clippy",
            },
        },
    },
})

vim.lsp.config("gopls", {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = function(bufnr, on_dir)
        local root = vim.fs.root(bufnr, {
            "go.work",
            "go.mod",
            ".git",
        })
        on_dir(root)
    end,
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
        },
    },
})

vim.lsp.config("bashls", {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "bash-language-server", "start" },
    filetypes = { "sh", "bash" },
    root_dir = function(bufnr, on_dir)
        local root = vim.fs.root(bufnr, { ".git" })
        on_dir(root)
    end,
    single_file_support = true,
})

-- =========================================================
-- Enable only selected servers
-- =========================================================
for _, server in ipairs(servers_to_enable) do
    local name = vim.split(server, "@")[1]
    vim.lsp.enable(name)
end-- =========================================================
-- Neovim 0.11+ native LSP config
-- no require("lspconfig")
-- no none-ls
-- =========================================================

local function has_any_file(markers)
    local cwd = vim.uv.cwd()
    for _, marker in ipairs(markers) do
        local path = vim.fs.find(marker, {
            upward = true,
            path = cwd,
            stop = vim.loop.os_homedir(),
        })[1]
        if path then
            return true
        end
    end
    return false
end

local function build_lsp_ensure_installed()
    local list = {}
    local seen = {}

    local function add(items)
        for _, item in ipairs(items) do
            if not seen[item] then
                seen[item] = true
                table.insert(list, item)
            end
        end
    end

    add({ "lua_ls" })

    local rules = {
        { markers = { "go.mod", "go.work" }, servers = { "gopls" } },
        {
            markers = {
                "pyproject.toml",
                "setup.py",
                "setup.cfg",
                "requirements.txt",
                "Pipfile",
                "pyrightconfig.json",
            },
            servers = { "pyright" },
        },
        {
            markers = { "package.json", "tsconfig.json", "jsconfig.json" },
            servers = { "ts_ls", "jsonls" },
        },
        { markers = { "Cargo.toml", "rust-project.json" }, servers = { "rust_analyzer" } },
        { markers = { "compile_commands.json", "compile_flags.txt" }, servers = { "clangd" } },
        { markers = { ".bashrc", ".bash_profile", ".zshrc" }, servers = { "bashls" } },
    }

    for _, rule in ipairs(rules) do
        if has_any_file(rule.markers) then
            add(rule.servers)
        end
    end

    return list
end

local servers_to_enable = build_lsp_ensure_installed()

-- =========================================================
-- Mason
-- =========================================================
local ok_mason, mason = pcall(require, "mason")
if ok_mason then
    mason.setup()
end

local ok_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
if ok_mason_lspconfig then
    mason_lspconfig.setup({
        ensure_installed = servers_to_enable,
        automatic_installation = true,
    })
end

-- =========================================================
-- Capabilities
-- =========================================================
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if ok_cmp then
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

-- =========================================================
-- Diagnostics
-- =========================================================
vim.diagnostic.config({
    virtual_text = false,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
        },
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})

-- =========================================================
-- Shared on_attach
-- =========================================================
local disable_formatting_servers = {
    ts_ls = true,
}

local on_attach = function(client, bufnr)
    if disable_formatting_servers[client.name] then
        client.server_capabilities.documentFormattingProvider = false
    end

    vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

    local ok_illuminate, illuminate = pcall(require, "illuminate")
    if ok_illuminate then
        illuminate.on_attach(client)
    end
end

-- =========================================================
-- Server configs
-- root_dir marker functions直接用 vim.fs.root
-- =========================================================

vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_dir = function(bufnr, on_dir)
        local root = vim.fs.root(bufnr, {
            ".luarc.json",
            ".luarc.jsonc",
            ".luacheckrc",
            ".stylua.toml",
            "stylua.toml",
            "selene.toml",
            "selene.yml",
            ".git",
        })
        on_dir(root)
    end,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

vim.lsp.config("pyright", {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_dir = function(bufnr, on_dir)
        local root = vim.fs.root(bufnr, {
            "pyproject.toml",
            "setup.py",
            "setup.cfg",
            "requirements.txt",
            "Pipfile",
            "pyrightconfig.json",
            ".git",
        })
        on_dir(root)
    end,
    single_file_support = true,
})

vim.lsp.config("ts_ls", {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
    },
    root_dir = function(bufnr, on_dir)
        local root = vim.fs.root(bufnr, {
            "package.json",
            "tsconfig.json",
            "jsconfig.json",
            ".git",
        })
        on_dir(root)
    end,
    single_file_support = true,
})

vim.lsp.config("jsonls", {
    capabilities = capabilities,
    on_attach = on_attach,
})

vim.lsp.config("clangd", {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = function(bufnr, on_dir)
        local root = vim.fs.root(bufnr, {
            "compile_commands.json",
            "compile_flags.txt",
            ".git",
        })
        on_dir(root)
    end,
    single_file_support = true,
})

vim.lsp.config("rust_analyzer", {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_dir = function(bufnr, on_dir)
        local root = vim.fs.root(bufnr, {
            "Cargo.toml",
            "rust-project.json",
            ".git",
        })
        on_dir(root)
    end,
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
            },
            checkOnSave = {
                command = "clippy",
            },
        },
    },
})

vim.lsp.config("gopls", {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = function(bufnr, on_dir)
        local root = vim.fs.root(bufnr, {
            "go.work",
            "go.mod",
            ".git",
        })
        on_dir(root)
    end,
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
        },
    },
})

vim.lsp.config("bashls", {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "bash-language-server", "start" },
    filetypes = { "sh", "bash" },
    root_dir = function(bufnr, on_dir)
        local root = vim.fs.root(bufnr, { ".git" })
        on_dir(root)
    end,
    single_file_support = true,
})

-- =========================================================
-- Enable only selected servers
-- =========================================================
for _, server in ipairs(servers_to_enable) do
    local name = vim.split(server, "@")[1]
    vim.lsp.enable(name)
end
