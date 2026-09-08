-- [[
--  Plugin Installation File
--  Install plugins here, light configuration is OK.
--  For complex configuration or dependencies, create a plugin file like so:
--  config-pluginname.lua
--  in this directory.
-- ]] --

return {
	-- Colorscheming
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
	},

	-- Vim Fugitive
	{ "tpope/vim-fugitive" },

	--  Linux Coding Style
	{ "gregkh/kernel-coding-style" },

	-- Lualine Statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Blankline for indentation
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},

	-- Telescope (fuzzy searcher)
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.6',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},

	-- TreeSitter (parser and syntax gen tool)
	{
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
    },

	-- NVIM-tree (NERDTree but neovim)
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
	},

	-- Mason LSP Configuration
	{
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},

    -- Opencode Configuration
    {
        "sudo-tee/opencode.nvim",
        dependencies = {
            {
                "MeanderingProgrammer/render-markdown.nvim",
                opts = {
                    anti_conceal = { enabled = false },
                    file_types = { 'markdown', 'opencode_output' },
                },
                ft = { 'markdown', 'Avante', 'copilot-chat', 'opencode_output' },
            },
            { 'saghen/blink.cmp', branch = "v1" },
            'nvim-telescope/telescope.nvim',
        },
    }
}
