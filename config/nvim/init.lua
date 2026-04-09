-- Iterate through all *.lua in specific directory
local function requireDir(dirName)
	local path = vim.fn.stdpath("config") .. "/lua/" .. dirName
	local files = vim.split(vim.fn.glob(path .. "/*.lua"), "\n", { trimempty = true })

	table.sort(files)

	for _, file in ipairs(files) do
		local name = vim.fn.fnamemodify(file, ":t:r")
		require(dirName .. "." .. name)
	end
end

requireDir("configs")
requireDir("plugins")
requireDir("lsp")
