local opt = vim.opt

-- line numbers
opt.number = true -- shows absolute line number on cursor line
opt.relativenumber = true -- shows relative line number

-- tabs & indentation
opt.tabstop = 4 -- 4 spaces for tabs (python default)
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tabs for spaces

--search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitve

-- cursor line
opt.cursorline = true -- highlight cursorline
opt.scrolloff = 8 -- get 8 line margins when scroll over the file

-- appearance
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split layout
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.iskeyword:append("-") -- consider string-string as whole word

opt.completeopt = "menu,menuone,noselect" -- menu setup for snippets

opt.termguicolors = true -- enable 24-bit RGB colors in the terminal
