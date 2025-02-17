return {
  'williamboman/mason.nvim',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'neovim/nvim-lspconfig',
  },
  config = function()
    local lspconfig = require('lspconfig')

    require('mason').setup({
      ui = {
        icons = {
          ---@since 1.0.0
          -- The list icon to use for installed packages.
          package_installed = '●',
          ---@since 1.0.0
          -- The list icon to use for packages that are installing, or queued for installation.
          package_pending = '➜',
          ---@since 1.0.0
          -- The list icon to use for packages that are not installed.
          package_uninstalled = '○',
        },
      },
    })
    require('mason-lspconfig').setup({
      ensure_installed = { 'lua_ls', 'rust_analyzer' },
    })

    require('mason-tool-installer').setup({
      ensure_installed = {
        -- formatters
        'prettier', -- prettier formatter
        'stylua', -- lua formatter
        'isort', -- python formatter
        'black', -- python formatter
        'fixjson', -- json formatter
        'shfmt', -- bash, mksh, shell formatter
        -- linters
        'pylint', -- python linter
        'eslint_d', -- js linter
        'cpplint', -- c/c++ linter
        'shellcheck', -- shell linter
        'yamllint', -- yaml linter
        'htmlhint', -- html linter
        'markdownlint', -- markdown linter
        'ts-standard', -- typescript linter
      },
    })

    local cmp_nvim_lsp = require('cmp_nvim_lsp')

    local custom_attach = function(client, bufnr)
      local opts = { buffer = bufnr, silent = true }
      local map = vim.keymap.set

      map('n', 'gD', vim.lsp.buf.declaration, opts)
      map('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
      map('n', 'gf', vim.lsp.buf.code_action, opts)
      map('n', 'K', vim.lsp.buf.hover, opts)
      map('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
      map('n', '<leader>rn', vim.lsp.buf.rename, opts)
      map('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
      map('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts)
      map('n', '[d', vim.diagnostic.goto_prev, opts)
      map('n', ']d', vim.diagnostic.goto_next, opts)
      map('n', '<leader>D', '<cmd>Telescope diagnostics bufnr=0<CR>', opts)
      map('n', '<leader>d', vim.diagnostic.open_float, opts)
      map('n', '<leader>rs', '<cmd>LspRestart<CR>', opts)
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    require('mason-lspconfig').setup_handlers({
      function(server)
        lspconfig[server].setup({})
      end,

      ['lua_ls'] = function()
        lspconfig['lua_ls'].setup({
          capabilities = capabilities,
          on_attach = custom_attach,
          on_init = function(client)
            if client.workspace_folders then
              local path = client.workspace_folders[1].name
              if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
                return
              end
            end
          end,
          settings = { -- custom settings for lua
            Lua = {
              diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
                -- Disable 'undefined-filed' error
                disable = { 'undefined-field' },
              },
              -- Make the server aware of Neovim runtime files
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME,
                },
              },
            },
          },
        })
      end,
    })
  end,
}
