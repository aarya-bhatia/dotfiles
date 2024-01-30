function SaveFile()
    local filename = vim.fn.expand('%:p')
    local timestamp = os.date("%Y-%m-%d %H:%M:%S")
    local line = "[" .. timestamp .. "]" .. " " .. filename .. "\n"
    local filepath = vim.fn.expand('~') .. '/.local/share/aarya/filemarks'
    local file = io.open(filepath, 'a')
    if file then
        file:write(line)
        file:close()
        print('File path appended to ' .. filepath)
    else
        print('Failed to open file: ' .. filepath)
    end
end

vim.cmd([[command! SaveFile lua SaveFile()]])

function SendRegisterToExternalCommand(cmd)
  local contents = vim.fn.getreg('"')
  local tmpfile = vim.fn.tempname()
  local file = io.open(tmpfile, "w")
  file:write(contents)
  file:close()
  print("Copied " .. string.len(contents) .. " bytes to " .. tmpfile)

  cmd="cat " .. tmpfile .. " | " .. cmd
  print(vim.fn.system(cmd))
end

