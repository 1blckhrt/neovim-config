return {
	"folke/flash.nvim",
	lazy = false,
	keys = {
		{
			"s",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
	},
	opts = {},
}
