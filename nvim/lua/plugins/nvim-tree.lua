-- local setup, tree = pcall(require, "nvim-tree")
-- if not setup then return end

local HEIGHT_RATIO = 0.8 -- You can change this
local WIDTH_RATIO = 0.5  -- You can change this too

-- nvim-tree setup
require("nvim-tree").setup {
  filters = {
    dotfiles = false,
    custom = { "^.git$", "^node_modules", "^.cache" }
  },
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    centralize_selection = false,
    preserve_window_proportions = true,
    signcolumn = "yes",
    number = true,
    relativenumber = true,
    -- float = {
    --   enable = true,
    --   open_win_config = function()
    --     local screen_w = vim.opt.columns:get()
    --     local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
    --     local window_w = screen_w * WIDTH_RATIO
    --     local window_h = screen_h * HEIGHT_RATIO
    --     local window_w_int = math.floor(window_w)
    --     local window_h_int = math.floor(window_h)
    --     local center_x = (screen_w - window_w) / 2
    --     local center_y = ((vim.opt.lines:get() - window_h) / 2)
    --                      - vim.opt.cmdheight:get()
    --     return {
    --       border = "rounded",
    --       relative = "editor",
    --       row = center_y,
    --       col = center_x,
    --       width = window_w_int,
    --       height = window_h_int,
    --     }
    --     end,
    -- },
    -- width = function()
    --   return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
    -- end,
    -- width = 35,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
    debounce_delay = 50,
    severity = {
      min = vim.diagnostic.severity.WARNING,
      max = vim.diagnostic.severity.ERROR,
    },
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = false,
    full_name = false,
    highlight_opened_files = "none",
    root_folder_modifier = ":~",
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        item = "│-",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    symlink_destination = true,
  },
  git = {
    enable = true,
    ignore = true,
    show_on_dirs = true,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    expand_all = {
      max_folder_discovery = 300,
      exclude = {},
    },
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
    remove_file = {
      close_window = true,
    },
  },

  log = {
    enable = true,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      dev = false,
      diagnostics = true,
      git = true,
      profile = false,
      watcher = false,
    },
  },

  disable_netrw = false, --true by default, disables netrw
  hijack_netrw = false, --true by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
  hijack_cursor = true, --true by default, when moving cursor in the tree, will position the cursor at the start of the file on the current line

  update_cwd = true, --false by default, will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.
  respect_buf_cwd = true, --false by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
}

--Dictionary of buffer option names mapped to a list of option values that
--indicates to the window picker that the buffer's window should not be
--selectable.
vim.g.nvim_tree_special_files = { ["README.md"] = 1, Makefile = 1, MAKEFILE = 1 } --List of filenames that gets highlighted with NvimTreeSpecialFile

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })

require("nvim-web-devicons").setup {
  color_icons = true,
  strict = true,
}

require("nvim-web-devicons").set_icon {
  sage = {
    icon = "󰿉",
    color = "#7e7ef5",
    name = "sage",
  },
}
require("nvim-web-devicons").set_icon_by_filetype {
    sage = "sage",
}

