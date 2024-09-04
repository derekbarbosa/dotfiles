-- [[ 
--  Plugin Installation File 
--  Install plugins here, light configuration is OK.
--  For complex configuration or dependencies, create a plugin file like so:
--  config-pluginname.lua
--  in this directory.
-- ]] --

return {
  -- Dracula Colorscheming
  { "Mofiqul/dracula.nvim" },

  -- Vim Fugitive
  { "tpope/vim-fugitive" },

  --  Linux Coding Style
  { "gregkh/kernel-coding-style"},

  -- Lualine Statusline
  { "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Blankline for indentation
  { "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },

  -- Telescope (fuzzy searcher)
  { 'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  -- TreeSitter (parser and syntax gen tool)
  { "nvim-treesitter/nvim-treesitter" },

  -- NVIM-tree (NERDTree but neovim)
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },

	-- Mason LSP Configuraition
	{
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
	},

}
