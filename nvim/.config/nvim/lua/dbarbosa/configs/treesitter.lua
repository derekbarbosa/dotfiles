-- treesitter-config.lua

local configs = require("nvim-treesitter.configs")
configs.setup {
  -- Add a language of your choice
  ensure_installed = {"c", "cpp", "python", "lua", "go", "javascript", "html", "erlang", "elixir", "vim", "vimdoc", "bash", },

  -- Install parsers synchronously
  sync_install = false,

  -- Automatically install a missing parser when entering a buffer
  auto_install = true,
  -- List of parsers to ignore installing
  ignore_install = { "" },

  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,

  },

  indent = { enable = true, disable = { "yaml" } },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
