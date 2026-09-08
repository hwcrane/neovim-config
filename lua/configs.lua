local opt = vim.opt

-- Side Numbers --
opt.nu = true -- line numbers
opt.relativenumber = true
opt.cursorline = true -- Highlight the line cursor is on
opt.cursorlineopt = "number" -- Only highlight the line number

-- Tabstops -- 
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- Mouse, indent, splits --
opt.mouse = 'nv' -- Use mouse in normal and visual mode
opt.smartindent = true -- Autoindent new lines
opt.splitright = true -- :vsplit opens to right
opt.wrap = false -- No word wrap

-- Undo history -- 
opt.swapfile = false -- Don't use a swapfile
opt.undofile = true -- Store an undo file

-- Search --
opt.hlsearch = false -- Don't highlight all results after searching
opt.incsearch = true -- Show search results whilst searching
opt.ignorecase = true
opt.smartcase = true

opt.completeopt = {"menuone", "noselect"} -- Show completion when only one option, dont auto select
opt.termguicolors = true -- 24 bit colours

opt.scrolloff = 8 -- Keep 8 rows at bottom
opt.signcolumn = "yes" -- Always reserve 1 column to left of numbers

opt.confirm = true
opt.updatetime = 50 -- 50ms delay after cursor movement
opt.spelllang = "en_gb"
