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
}

return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
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
        ensure_installed = servers
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")

      -- local servers = {
      --   "tailwindcss",
      --   "tsserver",
      --   "gopls",
      --   "pyright",
      --   "emmet_ls",
      --   "html",
      --   "lua_ls",
      --   "yamlls",
      --   "denols",
      --   "dockerls",
      -- }

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
