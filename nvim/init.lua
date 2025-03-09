require("config.lazy")
require("init")

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--Incremental live completion (note: this is now a default on master)
vim.o.inccommand = 'nosplit'

--Clipboard share
vim.o.clipboard='unnamed,unnamedplus'

--Set highlight on search
vim.o.hlsearch = false
vim.o.incsearch = true

--Make line numbers default
vim.wo.number = true

--Relative line numbering
vim.o.relativenumber = true

--Scroll off
vim.o.scrolloff = 8

--Do not save when switching buffers (note: this is now a default on master)
vim.o.hidden = true

--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
-- vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

--Tab settings
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.smartindent = true

vim.bo.autoindent = true
vim.bo.expandtab = true
vim.bo.softtabstop = 4
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.smartindent = true

vim.g.python_recommended_style = 0

--Split windows
vim.o.splitright = true
vim.o.splitbelow = true

--Enable 24-bit colour
vim.opt.termguicolors = true
vim.o.termguicolors = true

vim.g.coc_node_path = '/opt/homebrew/bin/node'

--Background transparency
vim.cmd [[
    highlight Normal ctermbg=none guibg=none
    highlight Visual cterm=none ctermbg=236 ctermfg=none guibg=Grey50
    highlight LineNr cterm=none ctermfg=240 guifg=#5c819f guibg=none
	highlight vertsplit guifg=fg guibg=bg
]]

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
-- (moved to 'lua/config/lazy.lua')

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

--Enable move lines in visual mode
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'J', "mzJ`z", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-d>', "<C-d>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', "<C-u>zz", { noremap = true, silent = true })

--Paste over text without losing buffer
vim.api.nvim_set_keymap('x', '<leader>p', "\"_dP", { noremap = true, silent = true })

-- Remap navigation keys
-- vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-h>', '<cmd><C-U>TmuxNavigateLeft<cr>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-j>', '<cmd><C-U>TmuxNavigateDown<cr>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-k>', '<cmd><C-U>TmuxNavigateUp<cr>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-l>', '<cmd><C-U>TmuxNavigateRight<cr>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>', { noremap = true, silent = true })

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
  ]],
  false
)

-- Y yank until the end of line  (note: this is now a default on master)
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })

--Map blankline
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_char_highlight = 'LineNr'
vim.g.indent_blankline_show_trailing_blankline_indent = false
--
-- Syntax highlight of .sage files (same as .py)
vim.cmd [[ autocmd BufReadPost,BufNewFile,BufRead *.sage set filetype=python ]]

--Custom vimconfig by craftzdog
vim.api.nvim_exec(
    [[
        " JavaScript
        au BufNewFile,BufRead *.es6 setf javascript
        " TypeScript
        au BufNewFile,BufRead *.tsx setf typescriptreact
        " Markdown
        au BufNewFile,BufRead *.md set filetype=markdown
        au BufNewFile,BufRead *.mdx set filetype=markdown
        " Flow
        au BufNewFile,BufRead *.flow set filetype=javascript

        set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md
    ]],
    false
)
vim.cmd [[
    autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType vue setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType lua setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType dart setlocal shiftwidth=2 tabstop=2 softtabstop=2
]]


vim.cmd [[
  autocmd FileWriteCmd,BufWriteCmd *.dart !dart format %:p
]]

