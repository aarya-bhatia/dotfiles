require('nvim-treesitter.configs').setup {
    ensure_installed = {},
    auto_install = true,
    highlight = { enable = true, additional_vim_regex_highlighting = false, },
    indent = { enable = false },
    matchup = { enable = true },
}

require'nvim-treesitter.configs'.setup {
  textobjects = {
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]]"] = "@function.outer",
      },
      goto_next_end = {
        ["]]"] = "@function.outer",
      },
      goto_previous_start = {
        ["[["] = "@function.outer",
      },
      goto_previous_end = {
      },
    },
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
}
