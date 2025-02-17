return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local lualine = require('lualine')

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        section_separators = { right = '', left = '' },
        component_separators = '|',
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          { 'mode', separator = { right = '', left = '' }, right_padding = 0 },
        },
        lualine_y = {
          { 'filetype' },
        },
        lualine_x = {
          {
            -- lazy_status.updates,
            -- cond = lazy_status.has_updates,
          },
          -- { "encoding" },
        },
        lualine_z = {
          { 'location', separator = { right = '', left = '' }, left_padding = 2 },
        },
      },
      extensions = { 'nvim-tree' },
    })
  end,
}
