local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
	return
end

local tree_cb = nvim_tree_config.nvim_tree_callback


nvim_tree.setup {
	update_focused_file = {
		enable = true,
		update_cwd = false,
	},
	renderer = {
		-- root_folder_modifier = ":t",
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
				special_files = {},
				symlink_destination = true,
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
	view = {
		-- width = 30,
		side = "left",
		mappings = {
			list = {
				{ key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
				{ key = "h", cb = tree_cb "close_node" },
				{ key = "v", cb = tree_cb "vsplit" },
				{ key = "u", action = "dir_up" },
			},
		},
	},
}
