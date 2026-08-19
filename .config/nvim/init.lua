vim.opt.number = true   		-- line number
vim.opt.relativenumber = true	-- relative line number
vim.opt.cursorline = true    	-- highlight current line
vim.opt.wrap = false 	    	-- do not wrap lines by default
vim.opt.scrolloff = 10 	    	-- keep 10 lines above/below cursor
vim.opt.sidescrolloff = 10   	-- keep 10 lines to left/right of cursor

vim.opt.tabstop = 4     		-- tabwidth
vim.opt.shiftwidth = 4	    	-- indent width
vim.opt.softtabstop = 4	    	-- soft tab stop not tabs on tab/backspace
vim.opt.expandtab = true    	-- use spaces instead of tabs
vim.opt.smartindent = true	    -- start auto-indent
vim.opt.autoindent = true   	-- copy indent from current line

vim.opt.ignorecase = true       -- case insensitive search
vim.opt.smartcase = true        -- case sensitive if uppercase in string
vim.opt.hlsearch = true         -- highlight search matches
vim.opt.incsearch = true        -- show matches as you type

vim.opt.signcolumn = "yes"      -- always show a sign column
vim.opt.colorcolumn = "100"     -- show a column at 100 position chars
vim.opt.showmatch = true        -- highlights matching brackets
