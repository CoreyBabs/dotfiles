-- Generic vim configs
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', { silent = true } )

vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

vim.o.clipboard = 'unnamedplus'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.wo.number = true
vim.wo.relativenumber = true

vim.o.breakindent = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = 'yes'

vim.o.completeopt = 'menuone,noselect'

vim.o.termguicolors = true

require("config.lazy")
require("config.keymaps")

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
