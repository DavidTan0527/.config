-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Setup lazy.nvim
require("lazy").setup({
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },

	'tpope/vim-fugitive', -- Git commands in nvim
	'tpope/vim-rhubarb', -- Fugitive-companion to interact with github
	'tpope/vim-commentary', -- "gc" to comment visual regions/lines
	'ludovicchabant/vim-gutentags', -- Automatic tags management

	-- UI to select things (files, grep results, open buffers...)
	{ 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- UI theme and visuals
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  'feline-nvim/feline.nvim',
  'levouh/tint.nvim',

	-- Add indentation guides even on blank lines
	'lukas-reineke/indent-blankline.nvim',

	-- Add git related info in the signs columns and popups
	{ 'lewis6991/gitsigns.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },

	-- Highlight, edit, and navigate code using a fast incremental parsing library
	'nvim-treesitter/nvim-treesitter',
	'nvim-treesitter/nvim-treesitter-textobjects',
	'HiPhish/rainbow-delimiters.nvim',

  -- Auto close brackets
  'm4xshen/autoclose.nvim',

  { "3rd/image.nvim", dependencies = { "luarocks.nvim" } },
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    config = true,
  },

	'neovim/nvim-lspconfig', -- Collection of configurations for built-in LSP client
	'hrsh7th/nvim-cmp', -- Autocompletion plugin
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-vsnip',
	'hrsh7th/vim-vsnip',
  'folke/trouble.nvim', -- List code diagnostics

	'jose-elias-alvarez/null-ls.nvim',
	'MunifTanjim/prettier.nvim',

  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  -- Tree directory
  'kyazdani42/nvim-web-devicons',
	'kyazdani42/nvim-tree.lua',

	-- Language support
	'pangloss/vim-javascript',
	'mxw/vim-jsx',
	'mfussenegger/nvim-jdtls', -- Java lang server
	'mfussenegger/nvim-dap', -- Java Debug Adapter Protocol
	'petRUShka/vim-sage',
})

