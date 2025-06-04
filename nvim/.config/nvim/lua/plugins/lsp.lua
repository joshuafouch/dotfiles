return {
  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
    },
    opts = {
      servers = {
        -- add pre-installed lsps here:
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
      },
    },
    config = function(_, opts)
      require('mason').setup()
      require('mason-lspconfig').setup {
        ensure_installed = { 'lua_ls', 'eslint', 'ts_ls' },
      }

      -- loop through all servers list
      for server, config in pairs(opts.servers) do
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end
    end,
  },
}
