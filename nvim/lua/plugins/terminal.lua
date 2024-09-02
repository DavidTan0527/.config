vim.g.term_buf = 0
vim.g.term_win = 0

vim.api.nvim_exec(
	[[
		let g:term_buf = 0
		let g:term_win = 0
		function! TermToggle(height)
			if win_gotoid(g:term_win)
				hide
			else
				botright new
				exec "resize " . a:height
				try
					exec "buffer " . g:term_buf
				catch
					call termopen($SHELL, {"detach": 0})
					let g:term_buf = bufnr("")
					set nonumber
					set norelativenumber
					set signcolumn=no
				endtry
				startinsert!
				let g:term_win = win_getid()
			endif
		endfunction
	]],
	false
)

vim.api.nvim_set_keymap('n', '<F2>', ':call TermToggle(16)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<F2>', '<Esc>:call TermToggle(16)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<F2>', '<C-\\><C-n>:call TermToggle(16)<CR>', { noremap = true, silent = true })

-- Terminal go back to normal mode
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', ':q!', '<C-\\><C-n>:q!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<S-Z><S-Z>', '<C-\\><C-n><S-Z><S-Z>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-W>', '<C-\\><C-n><C-W>', { noremap = true, silent = true })

--Terminal config
vim.api.nvim_exec(
    [[
        augroup insertonenter
            function! InsertOnTerminal()
                if &buftype ==# "terminal"
                    normal i
                endif
            endfunction

            autocmd! BufEnter * call InsertOnTerminal()
            if has('nvim')
                autocmd! TermOpen * call InsertOnTerminal()
            endif
        augroup END
    ]],
    false
)
