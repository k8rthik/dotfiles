return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			sync_install = false,
			auto_install = true,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},

			indent = { enable = false },

			ensure_installed = {
				"json",
				"javascript",
				"html",
				"css",
				"bash",
				"lua",
				"vim",
				"vimdoc",
				"c",
				"cpp",
				"ocaml",
				"r",
				"python",
				"markdown",
				"markdown_inline",
				"disassembly",
			},

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn",
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},
		})
	end,
}
