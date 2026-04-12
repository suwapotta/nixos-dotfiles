local options = vim.opt

-- Line numbers and navigation
options.number = true -- Line numbers
options.relativenumber = true -- Relative line numbers
options.cursorline = true -- Highlight current line
options.wrap = false -- Don't wrap lines
options.scrolloff = 10 -- Keep 10 lines above/below cursor
options.sidescrolloff = 8 -- Keep 8 columns left/right of cursor

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
options.hlsearch = false -- Don't highlight search results
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
options.completeopt = "menu,menuone,noselect"
options.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
options.confirm = true -- Confirm to save changes before exiting modified buffer
options.concealcursor = "" -- Don't hide cursor line markup
options.synmaxcol = 300 -- Syntax highlighting limit
options.ruler = false -- Disable the default ruler
options.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
options.winminwidth = 5 -- Minimum window width

-- File handling
options.backup = false -- Don't create backup files
options.writebackup = false -- Don't create backup before writing
options.swapfile = false -- Don't create swap files
options.undofile = true -- Persistent undo
options.undolevels = 10000
options.undodir = vim.fn.expand("~/.vim/undodir") -- Undo directory
options.updatetime = 300 -- Faster completion
options.timeoutlen = vim.g.vscode and 1000 or 300 -- Lower than default (1000) to quickly trigger which-key
options.ttimeoutlen = 0 -- Key code timeout
options.autoread = true -- Auto reload files changed outside vim
options.autowrite = true -- Auto save

-- Behavior settings
options.hidden = true -- Allow hidden buffers
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
options.splitkeep = "screen"

-- Command-line completion
options.wildmenu = true
options.wildmode = "longest:full,full"
options.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

-- Better diff optionsions
options.diffopt:append("linematch:60")

-- Performance improvements
options.redrawtime = 10000
options.maxmempattern = 20000

options.fillchars = {
  foldopen = " ",
  foldclose = " ",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

options.jumpoptions = "view"
options.laststatus = 3 -- global statusline
options.list = false
options.linebreak = true -- Wrap lines at convenient points
options.list = true -- Show some invisible characters (tabs...
options.shiftround = true -- Round indent
options.shiftwidth = 2 -- Size of an indent

vim.filetype.add({
  extension = {
    env = "dotenv",
  },
  filename = {
    [".env"] = "dotenv",
    ["env"] = "dotenv",
  },
  pattern = {
    ["[jt]sconfig.*.json"] = "jsonc",
    ["%.env%.[%w_.-]+"] = "dotenv",
  },
})
