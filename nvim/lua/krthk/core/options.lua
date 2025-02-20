vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- text wrapping
opt.textwidth = 0
opt.wrapmargin = 0
opt.wrap = true
opt.linebreak = true

-- line numbers
opt.relativenumber = true
opt.number = true

-- mode no longer needed with lualine
opt.showmode = false
opt.background = "dark"

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.smartindent = true
opt.cindent = true

-- search settings
opt.incsearch = true -- highlight all matches incrementally
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.hlsearch = true -- highlight text while searching

opt.cursorline = true
opt.scrolloff = 999

opt.termguicolors = true
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false
