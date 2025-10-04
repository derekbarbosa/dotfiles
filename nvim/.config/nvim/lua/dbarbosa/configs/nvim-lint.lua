local lint = require('lint')

lint.linters_by_ft = {
	c = { "checkpatch" },
	h = { "checkpatch" },
	markdown = { "vale" },
	md = { "vale" },
	txt = { "vale" },
	rst = { "vale" },
	json = { "jsonlint" },
	yaml = { "yamllint" },
}
lint.linters.checkpatch = {
	name = "checkpatch",
	cmd = "/home/debarbos/workspace/clones/linux/scripts/checkpatch.pl",
	args = { "--no-tree", "--file", "%f" },
}
vim.api.nvim_create_autocmd(
	{ "BufWinEnter", "BufEnter", "BufWritePost", "BufReadPost", "InsertLeave", "TextChanged" },
	{
		callback = function()
			lint.try_lint()
		end,
	}
)
