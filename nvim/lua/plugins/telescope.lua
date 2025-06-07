return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
      },
    config = function()
      require('telescope').setup {
	extensions = {
	  fxf = {}
	}
      }

      require('telescope').load_extension('fzf')

      vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>/', function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
	  winblend = 10,
	  previewer = false,
	})
      end, { desc = '[/] Fuzzily search in current buffer' })


      vim.keymap.set("n", "<space>sf", require('telescope.builtin').find_files, { desc = "[S]earch [F]iles" })
      vim.keymap.set("n", "<space>sh", require('telescope.builtin').help_tags, { desc = "[S]earch [H]elp" })
      vim.keymap.set("n", "<space>sg", require('telescope.builtin').live_grep, { desc = "[S]earch [G]rep" })
      vim.keymap.set("n", "<space>sd", require('telescope.builtin').diagnostics, { desc = "[S]earch [D]iagnostics" })
      vim.keymap.set("n", "<space>sk", require('telescope.builtin').keymaps, { desc = "[S]earch [K]eymaps" })
    end
  },
}
