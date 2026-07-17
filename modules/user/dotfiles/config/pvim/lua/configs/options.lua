local options = vim.opt

-- Line number and navigation
options.number = true -- Line numbers
options.relativenumber = true -- Relative line numbers
options.cursorline = true -- Highlight current line
options.wrap = false -- Don't wrap lines
options.linebreak = true -- Wrap lines at convenient points
options.scrolloff = 10 -- Lines of context
options.sidescrolloff = 8 -- Columns of context

-- Indentation
options.tabstop = 2 -- Tab width
options.shiftwidth = 2 -- Indent width
options.softtabstop = 2 -- Soft tab stop
options.expandtab = true -- Use spaces instead of tabs
options.smartindent = true -- Smart auto-indenting
options.autoindent = true -- Copy indent from current line

-- Search settings
options.ignorecase = true -- Case insensitive search
options.smartcase = true -- Case sensitive if uppercase in search
options.incsearch = true -- Show matches as you type

-- Visual settings
options.termguicolors = true -- Enable 24-bit colors
options.signcolumn = "yes" -- Always show sign column
options.showmatch = true -- Highlight matching brackets
options.matchtime = 2 -- How long to show matching bracket
options.cmdheight = 1 -- Command line height
options.showmode = false -- Don't show mode in command line
options.pumheight = 10 -- Popup menu height
options.pumblend = 10 -- Popup menu transparency
options.winblend = 0 -- Floating window transparency
options.completeopt = "menu,menuone,noselect" -- Better autocomplete experience
options.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
options.confirm = true -- Confirm to save changes before exiting modified buffer
options.concealcursor = "" -- Don't hide cursor line markup
options.ruler = false -- Disable the default ruler
options.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
options.winminwidth = 5 -- Minimum window width
options.laststatus = 3 -- global statusline
options.list = true -- Show some invisible characters (tabs...)
options.listchars = { -- Characters to show for opts.list
	tab = "» ",
	trail = "·",
	nbsp = "␣",
	extends = "…",
}
options.guicursor = "n-v-ve-c-sm:block,i-ci:ver25-Cursor,r-cr-o:hor20" -- Block cursor in visual mode

-- File handling
options.backup = false -- Don't create backup files
options.writebackup = false -- Don't create backup before writing
options.swapfile = false -- Don't create swap files
options.undofile = true -- Persistent undo
options.undolevels = 10000
options.updatetime = 300 -- Faster completion
options.timeoutlen = vim.g.vscode and 1000 or 300 -- Lower than default (1000) to quickly trigger which-key
options.ttimeoutlen = 0 -- Key code timeout
options.autoread = true -- Auto reload files changed outside vim
options.autowrite = true -- Auto save

-- Behavior settings
options.hidden = true -- Allow hidden buffers
options.jumpoptions = "view"
options.errorbells = false -- No error bells
options.backspace = "indent,eol,start" -- Better backspace behavior
options.autochdir = false -- Don't auto change directory
options.iskeyword:append("-") -- Treat dash as part of word
options.path:append("**") -- include subdirectories in search
options.selection = "exclusive" -- Selection behavior
options.mouse = "a" -- Enable mouse support
options.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
options.modifiable = true -- Allow buffer modifications
options.encoding = "UTF-8" -- Set encoding

-- Folding settings
options.smoothscroll = true
vim.wo.foldmethod = "expr"
options.foldlevel = 99 -- Start with all folds open
options.formatoptions = "jcroqlnt" -- tcqj
options.grepformat = "%f:%l:%c:%m"
options.grepprg = "rg --vimgrep"

-- Split behavior
options.splitbelow = true -- Horizontal splits go below
options.splitright = true -- Vertical splits go right
options.splitkeep = "screen" -- Reduce scroll jitter when opening splits

-- Command-line completion
options.wildmenu = true
options.wildmode = "longest:full,full"
options.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

-- Better diff options
options.diffopt:append("linematch:60")

-- Performance improvements
options.synmaxcol = 250 -- Syntax highlighting limit
options.redrawtime = 10000
options.maxmempattern = 20000

-- Misc
options.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "",
	eob = " ",
}
