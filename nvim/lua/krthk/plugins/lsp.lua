return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"saghen/blink.cmp",
	},

	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		local lspconfig = require("lspconfig")
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup({
			ui = {
				icons = {
					package_installed = "+",
					package_pending = "...",
					package_uninstalled = "-",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"html",
				"tailwindcss",
				"lua_ls",
				"clangd",
				"biome",
				"pyright",
			},

			automatic_installation = true,
		})

		mason_lspconfig.setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({ capabilities = capabilities })
			end,
		})
	end,
}

-- 	config = function(_, opts)
-- 		local lspconfig = require("lspconfig")
-- 		for server, config in pairs(opts.servers) do
-- 			-- passing config.capabilities to blink.cmp merges with the capabilities in your
-- 			-- `opts[server].capabilities, if you've defined it
-- 			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
-- 			lspconfig[server].setup(config)
-- 		end
-- 	end,
--
-- 	-- example calling setup directly for each LSP
-- 	config = function()
-- 		local capabilities = require("blink.cmp").get_lsp_capabilities()
-- 		local lspconfig = require("lspconfig")
--
-- 		lspconfig["lua_ls"].setup({ capabilities = capabilities })
-- 	end,
-- }
