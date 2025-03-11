vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false
vim.opt.colorcolumn = "81"
vim.opt.scrolloff = 8
vim.opt.updatetime = 50
vim.opt.signcolumn = 'yes'
vim.opt.list = true
vim.opt.listchars = { tab = '>> ', trail = '.', nbsp = '_' }
vim.opt.cursorline = true

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>')
vim.keymap.set("n", "W", vim.diagnostic.open_float, { noremap = true, silent = true })

vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end
})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking.",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end
})

vim.diagnostic.config({
    virtual_text = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = ""
    }
})

require("config.lazy")
