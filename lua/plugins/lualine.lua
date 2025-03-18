return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local lualine = require("lualine")

      local config = {
        sections = {
          lualine_x = {},
        },
      }

      table.insert(config.sections.lualine_x, {
        function()
          local buffer_file_type = vim.api.nvim_get_option_value("filetype", { buf = 0 })
          local clients = vim.lsp.get_clients()

          if next(clients) == nil then
            return "No Active Lsp"
          end

          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes

            if filetypes and vim.fn.index(filetypes, buffer_file_type) ~= -1 then
              return client.name
            end
          end
        end,
        icon = "  LSP:",
        color = { fg = "#ffffff", gui = "bold" },
      })

      lualine.setup(config)
    end,
  },
}
