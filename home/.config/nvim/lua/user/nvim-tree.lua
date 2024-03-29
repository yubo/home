local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local function my_on_attach(bufnr)
	local api = require('nvim-tree.api')

	local function opts(desc)
		return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set('n', 'C', api.tree.change_root_to_node,   opts('CD'))
	vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
	vim.keymap.set('n', 'l', api.node.open.edit,             opts('Open'))
	vim.keymap.set('n', 'y', api.fs.copy.node,               opts('Copy'))
	vim.keymap.set('n', 'c', api.fs.create,                  opts('Create'))
	vim.keymap.set('n', 'v', api.node.open.vertical,         opts('Open: Vertical Split'))
	vim.keymap.set('n', 's', api.node.open.horizontal,       opts('Open: Horizontal Split'))
end

nvim_tree.setup {
	on_attach = my_on_attach,
	update_focused_file = {
		enable = true,
		update_cwd = false,
	},
	renderer = {
		icons = {
			show = {
				file = false,
				folder = false,
				-- folder_arrow = false,
			},
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "",
					staged = "",
					unmerged = "",
					renamed = "",
					untracked = "",
					deleted = "",
					ignored = "",
				},
			},
		},
	},
	diagnostics = {
		enable = false,
		show_on_dirs = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	filters = {
		dotfiles = true,
		git_clean = false,
		no_buffer = false,
		custom = {},
		exclude = {".conf"},
	},
	filesystem_watchers = {
		enable = true,
		debounce_delay = 50,
		ignore_dirs = {},
	},
}

