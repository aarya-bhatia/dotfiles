local lint = require('lint')

lint.linters_by_ft = {
	cpp = {'clangtidy',},
	c = {'clangtidy',}
}

vim.keymap.set("n", "<leader>le", function()
	lint.try_lint()
end)
