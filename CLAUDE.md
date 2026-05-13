# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Personal dotfiles repository (`yubo/home`) managing development environment configs (bash, tmux, vim/neovim, git, ssh, etc.) across macOS, Ubuntu, and CentOS.

## Installation & Setup

```bash
git clone git@github.com:yubo/home.git ~/.yubo
cd ~/.yubo && sh install.sh
nvim        # then :Lazy sync to install plugins
```

`install.sh` symlinks files from `home/` into `~`, backing up existing files to `~/.home_bak/`. After modifying tracked files locally, use `git update-index --assume-unchanged` to prevent noise in git status.

## Repository Structure

- `home/` — Source config files that get symlinked to `~/`
  - `.bash_profile` — Shell config (PATH, aliases, prompt, helper functions)
  - `.config/nvim/` — Neovim config (Lua-based, lazy.nvim)
  - `.vim/`, `.vimrc` — Vim config (vim-plug)
  - `.tmux.conf` — Tmux config (prefix: Ctrl-a)
  - `.gitconfig` — Git config (editor: nvim, difftool: nvimdiff)
  - `.ssh/config` — SSH config (modular via `conf.d/`)
  - `bin/` — Utility scripts
- `install.sh` — Bootstrap script (creates symlinks, sets permissions)
- `docs/` — Platform-specific and feature docs (osx, ubuntu, centos, nvim, shell, tmux, golang)
- `misc/` — Supplementary configs (nginx, terminal color schemes)

## Architecture Notes

**Symlink pattern**: All configs live under `home/` and are symlinked to their corresponding `~/` paths by `install.sh`. Edit files in this repo, not in `~/`.

**Neovim config structure** (`home/.config/nvim/`):
- `init.lua` — Entry point, loads modules in order: options -> keymaps -> plugins -> configs -> LSP
- `lua/options.lua` — Editor settings
- `lua/keymaps.lua` — Key mappings (leader = `,`)
- `lua/plugins.lua` — lazy.nvim plugin declarations
- `lua/configs.lua` — Plugin configurations
- `lua/configs/lsp.lua` — LSP setup via Mason + native vim.lsp

**Bash config**: `.bash_profile` uses helper functions (`add_path`, `_source`, `_source_once`) for conditional PATH/source management. Local overrides go in `~/.bashrc` (sourced by `.bash_profile`).

**Local overrides**: Git uses `~/.gitconfig.local`, SSH uses `~/.ssh/conf.d/*`, bash uses `~/.bashrc` — these are not tracked in this repo.

## Key Conventions

- EditorConfig enforced: Go uses tabs (width 8), Python/JSON/Shell/Lua use 4 spaces, YAML/Markdown use 2 spaces
- Neovim plugins managed by lazy.nvim; Vim plugins managed by vim-plug
- Git aliases are extensive (see `.gitconfig`) — e.g., `s`=status, `d`=diff, `lg`=log graph
- Tmux prefix is `Ctrl-a` (not default `Ctrl-b`); pane navigation uses h/j/k/l
