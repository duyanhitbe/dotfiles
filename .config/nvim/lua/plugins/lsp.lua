return {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Lua LSP
		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = { "vim" }, -- Recognize 'vim' global
						enable = true,
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
					telemetry = {
						enable = false,
					},
					format = {
						enable = true,
						defaultConfig = {
							indent_style = "tab",
							indent_size = "4",
						},
					},
				},
			},
		})

		-- Go LSP
		vim.lsp.config("gopls", {
			capabilities = capabilities,
		})

		-- TypeScript LSP
		vim.lsp.config("ts_ls", {
			capabilities = capabilities,
		})

		-- ESLint LSP - Shows inline diagnostics
		vim.lsp.config("eslint", {
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				-- Auto-fix on save
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					command = "EslintFixAll",
				})
			end,
			settings = {
				workingDirectories = { mode = "auto" },
			},
		})

		-- Enable LSP servers
		vim.lsp.enable({ "lua_ls", "gopls", "ts_ls", "eslint" })
	end,
}
