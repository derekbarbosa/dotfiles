require('lint')
require('lint').linters.checkpatch = {
	name = "checkpatch",
	cmd = "/home/debarbos/workspace/clones/linux/scripts/checkpatch.pl",
	args = { "--file", "%f" },
	parser = "checkpatch", -- or a custom parser if needed
}
require('mason-nvim-lint').setup({
	ensure_installed = {},
	ignore_install = { "janet", "clj-kondo", "inko", "ruby" },
})
