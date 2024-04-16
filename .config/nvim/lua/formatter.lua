-- Formatter

local conform = require("conform")

-- Conform will run multiple formatters sequentially
-- Use a sub-list to run only the first available formatter
conform.setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "autopep8" },
        javascript = { { "prettierd", "prettier" } },
        cpp = { "clang-format" },
        html = { "prettier" },
        markdown = { "prettier" },
    },
})

vim.keymap.set("n", "<leader>F", function()
    conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
    })
end)
