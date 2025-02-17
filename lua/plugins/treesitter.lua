return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local treesitter = require('nvim-treesitter.configs')

      -- configure treesitter
      treesitter.setup({
        -- enable syntax highlighting
        highlight = {
          enable = true,
        },

        -- enable indentation
        indent = { enable = true },

        -- auto install parser for new filetypes
        auto_install = true,

        -- ensure these language parsers are installed
        ensure_installed = {
          'json',
          'json5',
          'javascript',
          'python',
          'rust',
          'fish',
          'markdown',
          'bash',
          'lua',
          'vim',
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<C-space>',
            node_incremental = '<C-space>',
            scope_incremental = false,
            node_decremental = '<bs>',
          },
        },
      })
    end,
  },
}
