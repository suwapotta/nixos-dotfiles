local opt = vim.opt
local autocmd = vim.api.nvim_create_autocmd

-- Dynamic change border color based on Neovim mode
opt.title = true
autocmd({ "ModeChanged", "VimEnter", "BufEnter" }, {
	callback = function()
		local mode = string.upper(vim.fn.mode())
		local filename = vim.fn.expand("%:t")

		if filename == "" then
			vim.opt.titlestring = "nvim-" .. mode .. " "
			return
		end

		vim.opt.titlestring = "nvim-" .. mode .. " - %t"
	end,
})
