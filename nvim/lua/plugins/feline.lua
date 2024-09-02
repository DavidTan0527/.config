local ctp_feline = require('catppuccin.groups.integrations.feline')

ctp_feline.setup()

local components = ctp_feline.get()
components.inactive = components.active

require("feline").setup({
  components = components,
  disable = {
    filetypes = {
      "NvimTree",
    },
  },
})
