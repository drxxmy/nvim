map = vim.keymap.set

map('n', 'Y', 'y$', { noremap = true, silent = true, desc = "Make 'Y' behave like 'y$'" })

-- Tabs navigation
map({ 'n', 't' }, '<A-h>', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true, desc = 'Switch to previous buffer' })
map({ 'n', 't' }, '<A-l>', '<Cmd>BufferNext<CR>', { noremap = true, silent = true, desc = 'Switch to next buffer' })
map('n', '<A-,>', '<Cmd>BufferMovePrevious<CR>', { noremap = true, silent = true, desc = 'Re-order buffer to previous' })
map('n', '<A-.>', '<Cmd>BufferMoveNext<CR>', { noremap = true, silent = true, desc = 'Re-order buffer to next' })

-- Tabs order
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', { noremap = true, silent = true, desc = 'Order buffer by number' })
map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', { noremap = true, silent = true, desc = 'Order buffer by name' })
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', { noremap = true, silent = true, desc = 'Order by buffer language' })

-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', { noremap = true, silent = true, desc = 'Go to buffer 1' })
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', { noremap = true, silent = true, desc = 'Go to buffer 2' })
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', { noremap = true, silent = true, desc = 'Go to buffer 3' })
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', { noremap = true, silent = true, desc = 'Go to buffer 4' })
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', { noremap = true, silent = true, desc = 'Go to buffer 5' })
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', { noremap = true, silent = true, desc = 'Go to buffer 6' })
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', { noremap = true, silent = true, desc = 'Go to buffer 7' })
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', { noremap = true, silent = true, desc = 'Go to buffer 8' })
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', { noremap = true, silent = true, desc = 'Go to buffer 9' })
map('n', '<A-0>', '<Cmd>BufferLast<CR>', { noremap = true, silent = true, desc = 'Go to the last buffer' })

-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', { noremap = true, silent = true, desc = 'Pin/Unpin current buffer' })

-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', { noremap = true, silent = true, desc = 'Close current buffer' })

-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', { noremap = true, silent = true, desc = 'Magic buffer-picking mode' })

-- Maximize current buffer
map({ 'n', 'v' }, '<leader>fw', '<Cmd>MaximizerToggle<CR>', { noremap = true, silent = true, desc = 'Maximize current buffer' })

-- Noice
map({ 'n', 'v' }, '<leader>nd', '<Cmd>NoiceDismiss<CR>', { noremap = true, silent = true, desc = 'Dismiss noice notifications' })

-- Split navigation
map('n', '<C-h>', '<C-w>h', { noremap = true, silent = true, desc = 'Move to the left split' })
map('n', '<C-j>', '<C-w>j', { noremap = true, silent = true, desc = 'Move to the bottom split' })
map('n', '<C-k>', '<C-w>k', { noremap = true, silent = true, desc = 'Move to the top split' })
map('n', '<C-l>', '<C-w>l', { noremap = true, silent = true, desc = 'Move to the right split' })

-- Split resize
map('n', '<C-Left>', ':vertical resize -2<CR>', { noremap = true, silent = true, desc = 'Resize split to the left' })
map('n', '<C-Right>', ':vertical resize +2<CR>', { noremap = true, silent = true, desc = 'Resize split to the right' })
map('n', '<C-Up>', ':resize -2<CR>', { noremap = true, silent = true, desc = 'Resize split to the top' })
map('n', '<C-Down>', ':resize +2<CR>', { noremap = true, silent = true, desc = 'Resize split to the bottom' })
