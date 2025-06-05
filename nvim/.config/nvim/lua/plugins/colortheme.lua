--return {
--    "neanias/everforest-nvim",
--    version = false,
--    lazy = false,
--    priority = 1000,
--    config = function()
--      require("everforest").setup({
--        require("everforest").load()
--      })
--    end,
--}
return {
  'sainnhe/sonokai',
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.sonokai_transparent_background = '1'
    vim.g.sonokai_enable_italic = true
    vim.g.sonokai_style = 'andromeda'
    vim.cmd.colorscheme 'sonokai'
  end,
}
