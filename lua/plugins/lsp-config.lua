return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "clangd" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      -- local capabilities = require("blink.cmp").get_lsp_capabilities()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.ts_ls.setup({ capabilities = capabilities })
      lspconfig.clangd.setup({ capabilities = capabilities })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local buf = event.buf
          local opts = { buffer = buf, noremap = true, silent = true }

          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          --vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, opts)
        end,
      })
    end,
  },
}
