return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
	"folke/lazydev.nvim",
	ft = "lua", -- only load on lua files
	opts = {
	  library = {
	    -- See the configuration section for more details
	    -- Load luvit types when the `vim.uv` word is found
	    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
	  },
	},
      },
    },
    vim.lsp.config("lua_ls", {
       settings = {
	Lua = {
	  runtime = {
	    version = 'LuaJIT',
	  }
	}
      }
    }),
    vim.lsp.enable("lua_ls"),
    vim.lsp.inlay_hint.enable(true),
    vim.diagnostic.config({ virtual_text = true }),
  }
}
