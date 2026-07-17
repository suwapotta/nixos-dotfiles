local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight on yank
autocmd("TextYankPost", {
	group = augroup("HighlightYank", { clear = true }),

	callback = function()
		(vim.hl or vim.highlight).on_yank()
	end,
})

-- Wrap and check for spell in text filetypes
autocmd("FileType", {
	pattern = { "text", "markdown", "gitcommit" },

	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- Restore cursor to file position in previous editing session
autocmd("BufReadPost", {
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			vim.api.nvim_win_set_cursor(0, mark)
			-- defer centering slightly so it's applied after render
			vim.schedule(function()
				vim.cmd("normal! zz")
			end)
		end
	end,
})

-- Auto resize splits when the terminal's window is resized
autocmd("VimResized", {
	command = "wincmd =",
})

-- Syntax highlighting for dotenv files
autocmd("BufRead", {
	group = augroup("dotenv_ft", { clear = true }),
	pattern = { ".env", ".env.*" },
	callback = function()
		vim.bo.filetype = "dosini"
	end,
})

-- Ide like highlight when stopping cursor
autocmd("CursorMoved", {
	group = augroup("LspReferenceHighlight", { clear = true }),
	desc = "Highlight references under cursor",
	callback = function()
		-- Only run if the cursor is not in insert mode
		if vim.fn.mode() ~= "i" then
			local clients = vim.lsp.get_clients({ bufnr = 0 })
			local supports_highlight = false
			for _, client in ipairs(clients) do
				if client.server_capabilities.documentHighlightProvider then
					supports_highlight = true
					break -- Found a supporting client, no need to check others
				end
			end

			-- 3. Proceed only if an LSP is active AND supports the feature
			if supports_highlight then
				vim.lsp.buf.clear_references()
				vim.lsp.buf.document_highlight()
			end
		end
	end,
})
-- Ide like highlight when stopping cursor
autocmd("CursorMovedI", {
	group = "LspReferenceHighlight",
	desc = "Clear highlights when entering insert mode",
	callback = function()
		vim.lsp.buf.clear_references()
	end,
})

-- Dynamic change NIRI's border color based on Neovim mode
vim.opt.title = true
vim.api.nvim_create_autocmd({ "ModeChanged", "VimEnter", "BufEnter" }, {
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
