local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
}

-- cool function for progress
local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end

local filename = {
	'filename',
	file_status = false,
	newfile_status = false,
	path = 0,
	-- shorting_target = 40,
}

local fileformat = {
	'fileformat',
	icons_enabled = false,
}

local mode = {
	'mode',
	fmt = function(str)
	       return str:sub(1,1)
        end,
}

lualine.setup({
		options = {
			icons_enabled = true,
			theme = "powerline",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
			always_divide_middle = true,
		},
		sections = {
			lualine_a = { mode },
			lualine_b = { branch },
			lualine_c = { filename },
			lualine_x = { "encoding", fileformat, filetype },
			lualine_y = { location },
			lualine_z = { "progress" },
		},
		inactive_sections = {
			lualine_a = { filename },
			lualine_b = {},
			lualine_c = {},
			lualine_x = { location },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		extensions = {},
	})
