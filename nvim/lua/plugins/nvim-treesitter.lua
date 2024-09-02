-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
  rainbow = {
    enable = true,
  }
}
--
-- This module contains a number of default definitions
local rainbow_delimiters = require 'rainbow-delimiters'

---@type rainbow_delimiters.config
vim.g.rainbow_delimiters = {
  strategy = {
    [''] = rainbow_delimiters.strategy['global'],
    vim = rainbow_delimiters.strategy['local'],
  },
  query = {
    [''] = 'rainbow-delimiters',
    html = 'rainbow-tags',
    latex = 'rainbow-blocks',
    vue = 'rainbow-tags',
  },
  priority = {
    [''] = 110,
    lua = 210,
  },
  highlight = {
    'RainbowDelimiterRed',
    'RainbowDelimiterYellow',
    'RainbowDelimiterBlue',
    -- 'RainbowDelimiterOrange',
    'RainbowDelimiterGreen',
    'RainbowDelimiterViolet',
    'RainbowDelimiterCyan',
  },
}

vim.cmd [[ highlight RainbowDelimiterRed  guifg=#e06c75 ctermfg=White ]]
vim.cmd [[ highlight RainbowDelimiterYellow  guifg=#e5c07b ctermfg=White ]]
vim.cmd [[ highlight RainbowDelimiterBlue  guifg=#61afef ctermfg=White ]]
-- vim.cmd [[ highlight RainbowDelimiterOrange  guifg=#be5046 ctermfg=White ]]
vim.cmd [[ highlight RainbowDelimiterGreen  guifg=#98c379 ctermfg=White ]]
vim.cmd [[ highlight RainbowDelimiterViolet  guifg=#c678dd ctermfg=White ]]
vim.cmd [[ highlight RainbowDelimiterCyan  guifg=#56b6c2 ctermfg=White ]]

vim.treesitter.language.register('python', 'sage')

