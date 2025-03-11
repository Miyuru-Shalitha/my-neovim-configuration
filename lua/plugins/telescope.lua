return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    -- or                              , branch = '0.1.x',
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
      },
    },
    config = function()
      local telescope = require("telescope.builtin")
      vim.keymap.set("n", "<leader>fh", telescope.help_tags)
      vim.keymap.set("n", "<leader>ff", telescope.find_files)
      vim.keymap.set("n", "<leader>en", function()
        telescope.find_files({
          cwd = vim.fn.stdpath("config"),
        })
      end)
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
