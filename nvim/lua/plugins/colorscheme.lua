return {
  { 
    "rebelot/kanagawa.nvim",
    config = function()
      local kanagawa = require 'kanagawa'
      kanagawa.setup({ transparent = true })
      vim.cmd.colorscheme "kanagawa-wave"
    end
  } 
}
