local lspconfig = require('lspconfig')

lspconfig.pyright.setup{}
lspconfig.clangd.setup{}
lspconfig.gopls.setup{}



-- Step 1: Copy the bemol() function.
function bemol()
 local bemol_dir = vim.fs.find({ '.bemol' }, { upward = true, type = 'directory'})[1]
 local ws_folders_lsp = {}
 if bemol_dir then
  local file = io.open(bemol_dir .. '/ws_root_folders', 'r')
  if file then

   for line in file:lines() do
    table.insert(ws_folders_lsp, line)
   end
   file:close()
  end
 end

 for _, line in ipairs(ws_folders_lsp) do
  vim.lsp.buf.add_workspace_folder(line)
 end

end

-- Step 2: Call bemol() from your on_attach() function.
local on_attach = function(_, bufnr)
  -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = '[G]oto [D]efinition' })
  -- your other keymaps and the rest of your configuration here.

  opts = { buffer = bufnr }
  vim.keymap.set('n', '<leader>jo' , "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
  -- vim.keymap.set('n', 'crv' , "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
  -- vim.keymap.set('v', 'crv' , "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
  -- vim.keymap.set('n', 'crc' , "<Cmd>lua require('jdtls').extract_constant()<CR>", opts)
  -- vim.keymap.set('v', 'crc' , "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", opts)
  -- vim.keymap.set('v', 'crm' , "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)

  -- " If using nvim-dap
  -- " This requires java-debug and vscode-java-test bundles, see install steps in this README further below.
  -- nnoremap <leader>df <Cmd>lua require'jdtls'.test_class()<CR>
  -- nnoremap <leader>dn <Cmd>lua require'jdtls'.test_nearest_method()<CR>

  bemol()
end

lspconfig.jdtls.setup{
  on_attach=on_attach,
}
