return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'AckslD/nvim-neoclip.lua',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')
      local neoclip = require('neoclip')

      neoclip.setup()

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ['<C-k>'] = actions.move_selection_previous,
              ['<C-j>'] = actions.move_selection_next,
              ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
            },
          },
        },
      })

      telescope.load_extension('neoclip')
      telescope.load_extension('noice')
      telescope.load_extension('fzf')

      -- set keymaps
      local map = vim.keymap.set

      map('n', '<leader>fy', '<cmd>Telescope neoclip initial_mode=normal<cr>', { desc = 'Find yanked text/macros' })
      map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Fuzzy find files in cwd' })
      map('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', { desc = 'Fuzzy find recent files' })
      map('n', '<leader>fs', '<cmd>Telescope live_grep<cr>', { desc = 'Find string in cwd' })
      map('n', '<leader>fc', '<cmd>Telescope grep_string<cr>', { desc = 'Find string under cursor in cwd' })
    end,
  },
}
