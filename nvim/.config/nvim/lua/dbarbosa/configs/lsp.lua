vim.lsp.config('bashls', {
	filetypes = { 'bash',},
})

vim.lsp.config('clangd', {
	filetypes = { 'c', 'cpp',},
})

vim.lsp.config('css', {
	filetypes = { 'css', 'scss', 'less',},
})

vim.lsp.config('dockerls', {
	filetypes = { 'Dockerfile', 'dockerfile', 'containerfile',},
	root_markers = {
		'Dockerfile',
		'Containerfile',
	},
})

vim.lsp.config('gopls', {
	filetypes = { 'go',},
})

vim.lsp.config('html', {
	filetypes = { 'html', 'templ',},
})

vim.lsp.config('jsonls', {
	filetypes = { 'json', 'jsonc' },
})

vim.lsp.config('lua_ls', {
	filetypes = {'lua',},
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = {
					'vim',
					'require',
				},
			},
		},
	},
})

vim.lsp.config('mutt_ls', {
	filetypes = { 'muttrc', 'neomuttrc' },
})

vim.lsp.config('pyright', {
	filetypes = { 'python' },
	root_markers = {
		'pyproject.toml',
		'setup.py',
		'setup.cfg',
		'requirements.txt',
		'Pipfile',
		'pyrightconfig.json',
	},
})

vim.lsp.config('rust_analyzer', {
	filetypes = { 'rs', 'rust', },
})

