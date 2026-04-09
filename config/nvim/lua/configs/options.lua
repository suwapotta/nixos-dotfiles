local opt = vim.opt

-- Indentation and Editing
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.shiftround = true
opt.smartindent = true
opt.autowrite = true
opt.confirm = true
opt.undofile = true
opt.undolevels = 10000
opt.virtualedit = "block"

-- Display and UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.laststatus = 3
opt.showmode = false
opt.ruler = false
-- opt.list = true
opt.wrap = false
opt.linebreak = true
opt.conceallevel = 2
opt.termguicolors = true
opt.smoothscroll = true

-- Popup and Completion
opt.pumblend = 10
opt.pumheight = 10
opt.completeopt = "menu,menuone,noselect"
opt.wildmode = "longest:full,full"

-- Window Management
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"
opt.winminwidth = 5
opt.scrolloff = 4
opt.sidescrolloff = 8

-- Folding
opt.foldlevel = 99
opt.foldmethod = "indent"
opt.foldtext = ""
opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}

-- Search and Grep
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "nosplit"
opt.grepprg = "rg --vimgrep"
opt.grepformat = "%f:%l:%c:%m"

-- Formatting
opt.formatoptions = "jcroqlnt"

-- Timing and Performance
opt.updatetime = 200
opt.timeoutlen = 300

-- Clipboard
opt.clipboard = "unnamedplus"

-- Miscellaneous
opt.mouse = "a"
opt.spelllang = { "en" }
opt.jumpoptions = "view"
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shortmess:append({ W = true, I = true, c = true, C = true })
