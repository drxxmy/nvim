local gwidth = vim.api.nvim_list_uis()[1].width
local gheight = vim.api.nvim_list_uis()[1].height
local width = 80
local height = 30

return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local nvimtree = require('nvim-tree')

    -- configure nvim-tree
    nvimtree.setup({
      view = {
        width = width,
        relativenumber = true,
        float = {
          enable = true,
          quit_on_focus_loss = true,
          open_win_config = {
            relative = 'editor',
            width = width,
            height = height,
            row = (gheight - height) * 0.4,
            col = (gwidth - width) * 0.5,
          },
        },
      },
      --   float = {
      --     enable = true,
      --   },
      --   -- width = 32,
      -- },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = '', -- arrow when folder is closed
              arrow_open = '', -- arrow when folder is open
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { '.DS_Store' },
      },
      git = {
        ignore = false,
      },
    })

    -- set keymaps
    local map = vim.keymap.set

    map('n', '<leader>ee', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
    map('n', '<leader>ef', '<cmd>NvimTreeFindFileToggle<CR>', { desc = 'Toggle file explorer on current file' })
    map('n', '<leader>ec', '<cmd>NvimTreeCollapse<CR>', { desc = 'Collapse file explorer' })
    map('n', '<leader>er', '<cmd>NvimTreeRefresh<CR>', { desc = 'Refresh file explorer' })
  end,
}
