vim.g.mapleader = ' '
local set = vim.opt

set.nu = true
set.relativenumber = true
set.cursorline = true
set.cursorlineopt = "number"

set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true

set.mouse = ''
set.smartindent = true
set.splitright = true

set.wrap = false

set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true

set.hlsearch = false
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.completeopt = 'menuone,noselect'

set.termguicolors = true

set.scrolloff = 8
set.signcolumn = "yes"

set.updatetime = 50
