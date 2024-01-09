local servers = {
	"tailwindcss",
	"tsserver",
	"gopls",
	"pyright",
	"emmet_ls",
	"html",
	"lua_ls",
	"yamlls",
	"denols",
	"dockerls",
	"bashls",
	"jsonls",
	"cssls",
}

local linter_and_fotmatter = {
	"autopep8",
	"djlint",
	"eslint_d",
	"prettier",
	"stylua",
	"gofumpt",
	"golines",
	"goimports-reviser",
}

return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
		config = function()
			require("mason").setup()
			-- custom cmd to install linter and formatter
			vim.api.nvim_create_user_command("MasonInstallAll", function()
				if linter_and_fotmatter and #linter_and_fotmatter > 0 then
					vim.cmd("MasonInstall " .. table.concat(linter_and_fotmatter, " "))
				end
			end, {})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = servers,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			local on_attach = function(client, bufr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({
						group = augroup,
						buffer = bufr,
					})
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufr,
						callback = function()
							vim.lsp.buf.format({ bufr = bufr })
						end,
					})
				end
			end

			local lspconfig = require("lspconfig")

			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup({
					capabilities = capabilities,
					on_attach = on_attach,
				})
			end
		end,
	},
	{
		"olexsmir/gopher.nvim",
		ft = "go",
		config = function(_, opts)
			require("gopher").setup(opts)
		end,
		build = function()
			vim.cmd([[silent! GoInstallDeps]])
		end,
	},
}
