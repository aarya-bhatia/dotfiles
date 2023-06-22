require('lualine').setup {
  options = {
    theme = 'gruvbox',
    section_separators = '', 
    component_separators = '',
  }
}

require('Comment').setup()
require("oil").setup()

vim.opt.list = true
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    show_end_of_line = true,
}
