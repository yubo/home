# nvim

## 安装

```sh
# macOS
brew install neovim  # 需要 0.12+

# 从源码编译
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```

## 插件管理（lazy.nvim）

```sh
# 首次启动自动 bootstrap，之后：
:Lazy          # 打开插件管理面板
:Lazy sync     # 安装/更新插件
:Lazy clean    # 清理未使用的插件
```

## 基本说明

```
leader 设置为逗号（,），以下简称 l
l-x    表示先按 leader，再按 x
C-x    表示按住 Ctrl 同时按 x
space-x 表示先按空格，再按 x
```

---

## 快捷键

### Normal 模式 - 通用

| 快捷键 | 说明 |
|--------|------|
| `#` | 搜索光标下的单词 |
| `<C-h>` / `<C-l>` | 切换上/下一个 buffer |
| `<C-n>` / `<C-p>` | 下/上一个 quickfix 项 |
| `<C-j>` / `<C-k>` | 向下/上滚动 7 行 |
| `<C-e>` / `<C-y>` | 当前行下移/上移 |
| `<space>;` | 清除搜索高亮 |
| `<space>=` | 全文重新缩进 |
| `<space>-` | 水平分割窗口 |
| `<space>\|` | 垂直分割窗口 |
| `<space>h/j/k/l` | 切换窗口方向 |
| `<space>m` / `<space>M` | 开启/关闭鼠标 |
| `<space>q` | 关闭当前 tab 或 buffer |

### Insert 模式

| 快捷键 | 说明 |
|--------|------|
| `jk` / `kj` | 退出 insert 模式 |
| `<C-a>` | 行首 |
| `<C-e>` | 行尾 |
| `<C-b>` / `<C-f>` | 左移/右移一字符 |
| `<C-j>` / `<C-k>` | 上/下移动 |
| `<C-d>` | 删除右侧字符 |
| `<C-n>` | omnifunc 补全（手动触发） |
| `<C-l>` | 文件路径补全 |

### LSP 补全（自动触发）

| 快捷键 | 说明 |
|--------|------|
| `<C-n>` / `<C-p>` | 下/上选补全候选 |
| `<CR>` / `<C-y>` | 确认补全 |
| `<C-e>` | 关闭补全弹窗 |

### LSP 功能

| 快捷键 | 说明 |
|--------|------|
| `gd` | 跳转到定义 |
| `gi` | 跳转到实现 |
| `gr` | 查看引用 |
| `K` | 悬浮文档 |
| `]d` / `[d` | 下/上一个诊断 |
| `<leader>e` | 显示当前行诊断详情 |
| `<space>e` | 重命名符号 |
| `<leader>ca` | 代码操作 |
| `<leader>=` | 格式化当前文件 |
| `<leader>cx` | 打开 Trouble 诊断面板 |

### Git

| 快捷键 | 说明 |
|--------|------|
| `<leader>b` | 当前行 git blame（inline） |
| `<leader>gs` | git status（fugitive） |
| `<leader>gb` | git blame（全文） |
| `<leader>gd` | git diff（垂直分割） |
| `<leader>gh` | 当前文件历史 |
| `<leader>gH` | 分支历史 |
| `<leader>gv` | 切换 Diffview |
| `]c` / `[c` | 下/上一个 git hunk |

### 文件/搜索（Telescope）

| 快捷键 | 说明 |
|--------|------|
| `<leader>ff` / `<space>f` | 搜索文件 |
| `<leader>fg` / `<space>g` | 全局文本搜索 |
| `<leader>fb` / `<space>b` | 已打开的 buffer |
| `<leader>fh` | 搜索帮助文档 |
| `<leader>fp` | 搜索项目 |
| `<leader>pp` | 切换到项目根目录 |

### 文件树 / 工具

| 快捷键 | 说明 |
|--------|------|
| `<leader><space>` | 打开/关闭 nvim-tree |
| `<space>t` | 打开/关闭 Tagbar |
| `<leader>cr` | 重新加载 nvim 配置 |

### 跳转（Flash）

| 快捷键 | 说明 |
|--------|------|
| `s` | Flash 跳转（模糊搜索） |
| `S` | Flash Treesitter 跳转 |

### Markdown

| 快捷键 | 说明 |
|--------|------|
| `<leader>m` | 启用 render-markdown 渲染 |
| `<leader>mm` | 禁用 render-markdown 渲染 |

### 块选择（Vim 原生）

| 快捷键 | 说明 |
|--------|------|
| `di"` | 删除双引号内的内容 |
| `yi"` | 复制双引号内的内容 |
| `vi"` | 选取双引号内的内容 |

### 缩进

|   | NORMAL | INSERT | VISUAL |
|---|--------|--------|--------|
| + | `[n]>>` | `C-t` | `[n]>` |
| - | `[n]<<` | N/A | `[n]<` |

---

## 插件列表

### UI
| 插件 | 说明 |
|------|------|
| `rebelot/kanagawa.nvim` | 配色方案 |
| `nvim-lualine/lualine.nvim` | 状态栏 |
| `akinsho/bufferline.nvim` | buffer 标签栏 |
| `goolord/alpha-nvim` | 启动页 |
| `nvim-tree/nvim-tree.lua` | 文件树 |
| `majutsushi/tagbar` | 代码符号侧边栏 |
| `folke/which-key.nvim` | 快捷键提示 |

### 搜索/导航
| 插件 | 说明 |
|------|------|
| `nvim-telescope/telescope.nvim` | 模糊搜索框架 |
| `telescope-fzf-native.nvim` | fzf 加速引擎 |
| `folke/flash.nvim` | 快速跳转 |
| `ahmedkhalf/project.nvim` | 项目管理 |

### Git
| 插件 | 说明 |
|------|------|
| `tpope/vim-fugitive` | Git 操作 |
| `lewis6991/gitsigns.nvim` | 行内 git 变更标记 |
| `sindrets/diffview.nvim` | diff/history 视图 |
| `zivyangll/git-blame.vim` | 行 blame |

### LSP / 代码
| 插件 | 说明 |
|------|------|
| `mason-org/mason.nvim` | LSP 服务器安装管理 |
| `mason-org/mason-lspconfig.nvim` | Mason 与 lspconfig 桥接 |
| `neovim/nvim-lspconfig` | LSP 配置 |
| `folke/trouble.nvim` | 诊断信息面板 |
| `romus204/tree-sitter-manager.nvim` | Treesitter parser 管理与语法高亮 |

### 编辑辅助
| 插件 | 说明 |
|------|------|
| `windwp/nvim-autopairs` | 括号自动补全 |
| `kevinhwang91/nvim-bqf` | 增强 quickfix 窗口 |
| `folke/todo-comments.nvim` | TODO/FIXME 高亮 |
| `yubo/vim-log-highlighting` | 日志语法高亮 |

### AI / Markdown
| 插件 | 说明 |
|------|------|
| `github/copilot.vim` | GitHub Copilot |
| `MeanderingProgrammer/render-markdown.nvim` | Markdown 渲染 |
| `HakonHarnes/img-clip.nvim` | 图片粘贴到 Markdown |

---

## LSP 支持的语言

根据项目根目录自动检测并安装对应 LSP：

| 语言 | 检测文件 | LSP |
|------|---------|-----|
| Go | `go.mod`, `go.work` | gopls |
| Python | `pyproject.toml`, `requirements.txt` 等 | pyright |
| JS/TS | `package.json`, `tsconfig.json` | ts_ls, jsonls |
| Rust | `Cargo.toml` | rust_analyzer |
| C/C++ | `compile_commands.json` | clangd |
| Shell | `.bashrc`, `.bash_profile` 等 | bashls |
| Lua | `.luarc.json` 等 | lua_ls |

## Treesitter 语法高亮

自动安装以下语言的 parser：
`go lua python bash c javascript json typescript tsx rust yaml markdown`

依赖 `tree-sitter-cli`：
- macOS: 自动通过 brew 安装
- Linux: 需手动 `cargo install tree-sitter-cli`
