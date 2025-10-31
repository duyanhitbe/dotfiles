return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					-- Formatters
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettierd.with({
						-- Only run prettier on these filetypes
						filetypes = {
							"javascript",
							"javascriptreact",
							"typescript",
							"typescriptreact",
							"vue",
							"css",
							"scss",
							"less",
							"html",
							"json",
							"jsonc",
							"yaml",
							"markdown",
							"graphql",
						},
					}),
					null_ls.builtins.formatting.goimports,

					-- Linter - Shows additional diagnostics
					require("none-ls.diagnostics.eslint_d"),
				},
			})
		end,
	},
}
