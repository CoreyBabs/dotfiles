-- Config for small one off plugins
return {
  {
	"kylechui/nvim-surround",
	version = "^3.0.0",
	event = "VeryLazy",
	config = function()
	  require("nvim-surround").setup({})
	end
  },
  {
	'windwp/nvim-autopairs',
	event = "InsertEnter",
	opts = {},
  },
  {
	'lukas-reineke/indent-blankline.nvim',
	opts = {
	  show_trailing_blankline_indent = false,
	},
	config = function()
	  require("ibl").setup()
	end
  },
}
