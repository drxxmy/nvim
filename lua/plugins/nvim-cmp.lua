return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp', -- source for lsp
    'hrsh7th/cmp-cmdline', -- source for cmdline suggestions
    'hrsh7th/cmp-buffer', -- source for text in buffer
    'hrsh7th/cmp-calc', -- source for num calculation
    'FelipeLema/cmp-async-path', -- source for async file systen paths
    'L3MON4D3/LuaSnip', -- snippet engine
    'saadparwaiz1/cmp_luasnip', -- for autocompletion
    'rafamadriz/friendly-snippets', -- useful snippets
    'onsails/lspkind.nvim', -- vs-code like pictograms
  },
  config = function()
    local cmp = require('cmp')

    local luasnip = require('luasnip')

    local lspkind = require('lspkind')

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require('luasnip.loaders.from_vscode').lazy_load()

    local has_words_before = function()
      if vim.bo[0].buftype == 'prompt' then
        return false
      end
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
    end

    cmp.setup({
      -- Disable autocompletion for Telescope prompt and comments
      enabled = function()
        filetype = vim.api.nvim_buf_get_option(0, 'filetype')
        if filetype == 'TelescopePrompt' then
          return false
        end

        local context = require 'cmp.config.context'
        return not context.in_treesitter_capture('comment') and not context.in_syntax_group('Comment')
      end,

      preselect = cmp.PreselectMode.None,
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      completion = {
        completeopt = 'menu,menuone,noselect',
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ['<C-k>'] = cmp.mapping.select_prev_item(), -- previous suggestion
        ['<C-j>'] = cmp.mapping.select_next_item(), -- next suggestion
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(), -- close completion window
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<TAB>'] = cmp.mapping(function(fallback)
          if cmp.visible() and has_words_before() then
            -- confirm the first item in the menu when there's text before the cursor
            cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
          else
            fallback() -- if no suggestions, do nothing or insert a tab
          end
        end, { 'i', 's' }),
      },
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = 'calc' }, -- calculation
        { name = 'luasnip', keyword_length = 1 }, -- snippets
        { name = 'nvim_lsp', keyword_length = 2 }, -- lsp
        { name = 'buffer', keyword_length = 3 }, -- text within current buffer
        { name = 'async_path' }, -- file system paths
      }),
      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = '...',
        }),
      },
    })

    local mappings = {
      ['<Tab>'] = { c = function() end },
      ['<S-Tab>'] = { c = function() end },
      ['<C-k>'] = {
        c = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end,
      },
      ['<C-j>'] = {
        c = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end,
      },
    }

    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(mappings),
      sources = cmp.config.sources({
        { name = 'buffer' },
      }),
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(mappings),
      sources = cmp.config.sources({
        { name = 'async_path' },
        { name = 'cmdline' },
      }),
      matching = { disallow_symbol_nonprefix_matching = false },
    })
  end,
}
