-- https://github.com/rust-lang/rust-analyzer/blob/master/docs/user/generated_config.adoc
return {
	cmd = {"rust-analyzer"},
	filetypes = {"rust"},
	root_dir = util.root_pattern("Cargo.toml", "rust-project.json", ".git"),
	settings = {
		['rust-analyzer'] = {
			diagnostics = {
				enable = true
			}
		}
	}
}
