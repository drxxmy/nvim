return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  config = function()
    require('notify').setup({
      fps = 60,
      render = 'wrapped-compact',
      max_width = 44,
      stages = 'fade_in_slide_out',
      timeout = 1300,
    })

    require('noice').setup({
      views = {
        mini = {
          win_options = {
            winblend = 0,
          },
        },
      },
      cmdline = {
        enabled = true,
        icons = {
          ['/'] = { icon = '/', hl_group = 'DiagnosticWarn' },
          ['?'] = { icon = '?', hl_group = 'DiagnosticWarn' },
          [':'] = { icon = ':', hl_group = 'DiagnosticInfo', firstc = false },
        },
      },
      popupmenu = {
        enabled = true,
        backend = 'cmp',
      },
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,
      },
    })
  end,
}
