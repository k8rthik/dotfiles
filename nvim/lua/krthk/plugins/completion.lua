return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",

	version = "*",
	opts = {
		keymap = {
			preset = "super-tab",
			["<C-j>"] = { "select_next", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-Space>"] = { "show", "fallback" },
			["<C-e>"] = { "hide", "fallback" },
			["<C-.>"] = { "snippet_forward", "fallback" },
			-- ["<C-b>"] = { "snippet_back", "fallback" },
		},

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
	},
}
