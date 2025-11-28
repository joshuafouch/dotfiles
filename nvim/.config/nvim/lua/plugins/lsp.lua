return {
  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      'saghen/blink.cmp',
    },
    opts = {
      servers = {
        -- add more servers here
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = 'basic', -- "off" to disable all red squiggles, "basic" for standard checks
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { 'vim' },
              },
            },
          },
        },
        cssls = {},
        html = {},
        clangd = {},
        bashls = {
          settings = {
            filetypes = { 'sh', 'zsh' },
          },
        },
        rust_analyzer = {},
        ts_ls = {},
        eslint = {},
        svelte = {},
        tailwindcss = {},
        tinymist = {
          settings = {
            formatterMode = 'typstyle',
            exportPdf = 'onType',
            semanticTokens = 'disable',
          },
        },
      },
    },
    config = function(_, opts)
      require('mason').setup()
      require('mason-lspconfig').setup {
        ensure_installed = vim.tbl_keys(opts.servers),
      }

      -- loop through all servers list
      for server, config in pairs(opts.servers) do
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end
    end,
  },
}
