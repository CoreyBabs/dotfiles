local buffers = { -1, -1, -1, -1, -1}

local function store_buffer(idx, buf)
	buffers[idx] = buf
end

local function switch_to_buffer(idx)
	if not (vim.api.nvim_get_current_buf() == buffers[idx]) and vim.api.nvim_buf_is_valid(buffers[idx]) then
		vim.api.nvim_command('buffer ' .. buffers[idx])
		vim.api.nvim_command('normal! zz')
	end
end

vim.keymap.set("n", "<Space>b1", function() store_buffer(0, vim.api.nvim_get_current_buf()) end)
vim.keymap.set("n", "<Space>b2", function() store_buffer(1, vim.api.nvim_get_current_buf()) end)
vim.keymap.set("n", "<Space>b3", function() store_buffer(2, vim.api.nvim_get_current_buf()) end)
vim.keymap.set("n", "<Space>b4", function() store_buffer(3, vim.api.nvim_get_current_buf()) end)
vim.keymap.set("n", "<Space>b5", function() store_buffer(4, vim.api.nvim_get_current_buf()) end)

vim.keymap.set("n", "1", function () switch_to_buffer(0) end)
vim.keymap.set("n", "2", function () switch_to_buffer(1) end)
vim.keymap.set("n", "3", function () switch_to_buffer(2) end)
vim.keymap.set("n", "4", function () switch_to_buffer(3) end)
vim.keymap.set("n", "5", function () switch_to_buffer(4) end)
