require("catppuccin").setup({
  flavour = "macchiato", -- latte, frappe, macchiato, mocha
  transparent_background = true, -- disables setting the background color.
  show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
  term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
  dim_inactive = {
    enabled = false, -- dims the background color of inactive window
    shade = "dark",
    percentage = 0.005, -- percentage of the shade to apply to the inactive window
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = {
      enabled = true,
      show_root = true,
      transparent_panel = true, -- make the panel transparent
    },
    treesitter = true,
    notify = false,
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
})

vim.cmd [[ colorscheme catppuccin ]]
