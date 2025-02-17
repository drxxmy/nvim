return {
  'lewis6991/satellite.nvim',
  config = function()
    require('satellite').setup({
      excluded_filetypes = { 'NvimTree' },
    })
  end,
}
