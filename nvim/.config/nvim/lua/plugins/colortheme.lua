-- return {
--   'neanias/everforest-nvim',
--   version = false,
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require('everforest').setup {
--       require('everforest').load(),
--     }
--   end,
-- }
--
return {
  'AlexvZyl/nordic.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('nordic').load()
  end,
}
