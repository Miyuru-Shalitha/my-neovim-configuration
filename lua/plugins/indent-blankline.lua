return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    config = function()
      require("ibl").setup({
        indent = {
          -- char = "\u{258F}"
          char = "\u{2506}"
        }
      })
    end,
  },
}
