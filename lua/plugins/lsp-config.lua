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

      local lspconfig = require("lspconfig")

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
          capabilities = capabilities,
        })
      end

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
