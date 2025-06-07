local state = {
	floating = {
		buf = -1,
		win = -1,
	}
}

local function create_floating_window(opts)
	opts = opts or {}
	local width = opts.width or math.floor(vim.o.columns * 0.8)
	local height = opts.height or math.floor(vim.o.lines * 0.8)

	local cx = math.floor((vim.o.columns - width) / 2)
	local cy = math.floor((vim.o.lines - height) / 2)

	local buf = nil
	if opts.buf ~= nil and vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = vim.api.nvim_create_buf(false, true)
	end

	local win_config = {
		relative = "editor",
		width = width,
		height = height,
		col = cx,
		row = cy,
		style = "minimal",
		border = "rounded",
	}

	local win = vim.api.nvim_open_win(buf, true, win_config)

	return { buf = buf, win = win }
end

-- A persistent terminal that will hide the buffer on hide
local function toggle_terminal()
	if not vim.api.nvim_win_is_valid(state.floating.win) then
		state.floating = create_floating_window({ buf = state.floating.buf })
		if vim.bo[state.floating.buf].buftype ~= "terminal" then
			vim.cmd.term()
		end

		vim.api.nvim_feedkeys("a", "t", false)
	else
		vim.api.nvim_win_hide(state.floating.win)
	end
end

local function close_terminal()
	vim.api.nvim_win_close(state.floating.win, true)
	state.floating = { buf = -1, win = -1 }
end

vim.api.nvim_create_user_command("Terminal", toggle_terminal, {})
vim.api.nvim_create_user_command("CloseTerminal", close_terminal, {})

vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
vim.keymap.set({"n", "t"}, "<space>tt", toggle_terminal, { desc = "[T]erminal [T]oggle"})
vim.keymap.set("t", "<space>tc", close_terminal, { desc = "[T]erminal [C]lose"})
