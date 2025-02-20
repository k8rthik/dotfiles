return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		lualine.setup({
			options = { theme = "everforest" },
			sections = {
				lualine_c = { { "filename", path = 2 } },
				lualine_x = {
					{ "filetype" },
				},
			},
		})
	end,
}
