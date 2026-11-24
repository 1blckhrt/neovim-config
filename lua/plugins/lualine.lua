return {
    "nvim-lualine/lualine.nvim",
	lazy = false,
	opts = {
        options = {
			globalstatus = true,
			component_separators = "",
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "filename" },
			lualine_c = {"diagnostics"},
			lualine_x = {},
			lualine_y = { "filetype" },
			lualine_z = { "lsp_status" },
		},
	},
}
