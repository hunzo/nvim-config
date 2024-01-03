return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
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

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier.with({
          extra_args = {
            "--no-semi",
            "--single-qoute",
            "--jsx-single-qoute",
          },
        }),
        -- null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.djlint,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.autopep8,
        null_ls.builtins.formatting.goimports_reviser,
        null_ls.builtins.formatting.golines,
        null_ls.builtins.formatting.djlint,
      },
      on_attach = on_attach,
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
