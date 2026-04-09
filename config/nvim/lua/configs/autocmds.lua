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

-- Highlight text when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({
			higroup = "Visual",
			timeout = 200,
		})
	end,
})

-- Automatically enable inlay hints when an LSP attaches
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp_inlay_hints", { clear = true }),
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)

		if client and client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
		end
	end,
})
