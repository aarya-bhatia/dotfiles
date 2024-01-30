require('Comment').setup()
-- require('ibl').setup()
require('marks').setup()

vim.opt.list = false
vim.opt.listchars:append "eol:↴"
vim.opt.listchars:append "space:⋅"

function SendRegisterToExternalCommand(cmd)
	local contents = vim.fn.getreg('"')
	local tmpfile = vim.fn.tempname()
	local file = io.open(tmpfile, "w")
	if file == nil then return end
	file:write(contents)
	file:close()
	print("Copied " .. string.len(contents) .. " bytes to " .. tmpfile)

	cmd = "cat " .. tmpfile .. " | " .. cmd
	print(vim.fn.system(cmd))
end
