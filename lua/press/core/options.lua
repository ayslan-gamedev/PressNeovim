vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = false
opt.number = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false 

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

vim.opt.background = "dark"
vim.cmd[[highlight Normal guibg=NONE ctermbg=NONE]]
vim.cmd[[highlight NonText guibg=NONE ctermbg=NONE]]
vim.cmd[[highlight LineNr guibg=NONE ctermbg=NONE]]
vim.cmd[[highlight SignColumn guibg=NONE ctermbg=NONE]]

-- Defina as cores desejadas
vim.cmd[[highlight LineNr guifg=#D2FF72]]      -- Altere a cor dos números (linha atual)
vim.cmd[[highlight CursorLineNr guifg=#15B392]] 

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false



