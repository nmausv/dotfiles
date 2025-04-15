vim.cmd("set t_Co=256")

vim.opt.encoding = 'utf-8' -- UTF-8 character encoding

-- Indent 2 spaces
vim.opt.tabstop = 2                  -- 2 space tabs
vim.opt.shiftwidth = 2               -- 2 space shift
vim.opt.softtabstop = 2              -- Tab spaces in no hard tab mode
vim.opt.expandtab = true             -- Expand tabs into spaces
vim.opt.autoindent = true            -- autoindent on new lines

vim.opt.showmatch = true             -- Highlight matching braces

vim.opt.ruler = true                 -- Show bottom ruler
vim.opt.number = true                -- Show absolute line number
vim.opt.relativenumber = true        -- Show relative line numbers

vim.opt.equalalways = true           -- Split windows equal size

vim.opt.formatoptions = 'croq'       -- Enable comment line auto formatting

vim.opt.title = true                 -- Set window title to file
vim.opt.hlsearch = true              -- Highlight on search
vim.opt.ignorecase = true            -- Search ignoring case
vim.opt.smartcase = true             -- Search using smartcase
vim.opt.incsearch = true             -- Start searching immediately

vim.opt.scrolloff = 5                -- Never scroll off
vim.opt.wildmode = longest, list, full -- Better unix-like tab completion
vim.opt.wildmenu = true
vim.opt.clipboard = 'unnamed'        -- Copy and paste from system clipboard
vim.opt.lazyredraw = true            -- Don't redraw while running macros (faster)
vim.opt.wrap = false                 -- Visually wrap lines
-- vim.opt.backspace = indent,eol,start  -- Better backspacing
vim.opt.linebreak = true             -- Intelligently wrap long files
vim.opt.ttyfast = true               -- Speed up vim
vim.opt.startofline = false          -- Vertical movement preserves horizontal position

--  Strip whitespace from end of lines when writing file
vim.cmd("autocmd BufWritePre * :%s/\\s\\+$//e")

-- correct python neovim
vim.g.python3_host_prog = "/Users/nmaus/.pyenv/shims/python"

--  Syntax highlighting and stuff
vim.opt.syntax = 'enable'
vim.opt.foldmethod = 'expr'
vim.cmd("filetype plugin indent on")
