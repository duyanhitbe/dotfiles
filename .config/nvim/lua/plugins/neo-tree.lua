return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false,
		config = function()
			require("neo-tree").setup({
				window = {
					position = "right",
				},
				event_handlers = {

					{
						event = "file_open_requested",
						handler = function()
							require("neo-tree.command").execute({ action = "close" })
						end,
					},
				},
				filesystem = {
					filtered_items = {
						hide_dotfiles = false,
						hide_gitignored = false,
					},
					follow_current_file = {
						enabled = true,
						leave_dirs_open = false,
					},
				},
			})
		end,
	},
}
