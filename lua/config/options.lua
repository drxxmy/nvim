-- Disable intro message
vim.opt.shortmess:append('sI')

-- General
vim.opt.mouse = 'a' -- allow mouse use
vim.opt.scrolloff = 8 -- keep cursor this amount of lines away from screen border
vim.opt.clipboard = vim.opt.clipboard + 'unnamedplus' -- copy & paste

-- Tab
vim.opt.tabstop = 4 -- width of a tab character
vim.opt.softtabstop = 4 -- number of spaces in tab when editing
vim.opt.shiftwidth = 4 -- number of spaces for indentation
vim.opt.expandtab = true -- convert tabs into spaces

-- UI
vim.opt.number = true -- add numbers to each line on the left side
vim.opt.relativenumber = true -- use relative numbers
vim.opt.cursorline = true -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true -- new horizontal split goes below
vim.opt.splitright = true -- new vertical split goes right

-- Searching
vim.opt.incsearch = true -- search as characters are entered
vim.opt.hlsearch = false -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered

-- Disable Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Disable unnecessary providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0

-- Go to previous/next line with h,l,left arrow and right arrow when cursor reaches end/beginning of line
vim.opt.whichwrap:append '<>[]hl'
