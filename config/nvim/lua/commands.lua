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

