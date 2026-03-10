-- ========================================================================== --
--  1. BOOTSTRAP LAZY.NVIM (Plugin Manager)
-- ========================================================================== --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

-- ========================================================================== --
--  2. GLOBAL OPTIONS & SETTINGS
-- ========================================================================== --
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

-- UI & Visuals
opt.termguicolors = true
opt.background = "dark"
opt.number = true
opt.relativenumber = true     -- Set to true if you prefer relative numbers
opt.cursorline = true
opt.laststatus = 3              -- Global statusline
opt.signcolumn = "yes"
opt.mouse = "a"
opt.wrap = false
opt.scrolloff = 0
opt.sidescrolloff = 8
opt.splitright = true
opt.splitbelow = true

-- Search & Fold
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true
opt.foldlevel = 0
opt.foldmethod = "manual"

-- Formatting / Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.guicursor = ''

-- System
opt.updatetime = 250
opt.timeoutlen = 300
-- opt.clipboard = "unnamedplus"   -- Modern clipboard handling
--

opt.swapfile = false

-- ========================================================================== --
--  3. PLUGINS (Lazy.nvim)
-- ========================================================================== --
require("lazy").setup({
    -- CORE UTILS
    "tpope/vim-fugitive",        -- Git integration
    "tpope/vim-repeat",          -- Better '.' repeats
    "wellle/targets.vim",        -- Extra text objects
    "nvim-tree/nvim-web-devicons", -- use with nerd font in terminal

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("lualine").setup({
            })
        end
    },

    {
        url = "ssh://git.amazon.com:2222/pkg/VimBrazilConfig",
        branch = "mainline",
        ft = "brazil-config",
    },

    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },

    -- MARKS (Replacement for vim-signature)
    { "chentoast/marks.nvim", opts = {} },

    -- MOTION (Modern replacement for Sneak)
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        },
    },

    {
        "romainl/vim-qf",
        opts = {},
        config = function() 
        end    
    },

    -- SYMBOLS (Replacement for Tagbar)
    {
        "stevearc/aerial.nvim",
        opts = {},
        keys = { { "<leader>tt", "<cmd>AerialToggle!<cr>", desc = "Symbols Outline" } }
    },

    -- COLORSCHEME (Lua Version)
    { "ellisonleao/gruvbox.nvim", priority = 1000, config = true },

    -- FILE EXPLORER (Modern NERDTree)
    {
        "nvim-tree/nvim-tree.lua",
        opts = { view = { width = 30 }, filters = { dotfiles = false } },
        keys = { 
            { "<leader>n", ":NvimTreeToggle<CR>", desc = "Toggle Tree" },
            { "<C-f>", ":NvimTreeFindFile<CR>", desc = "Find file in tree" }
        }
    },

    -- OIL.NVIM (File editing as a buffer)
    {
        "stevearc/oil.nvim",
        opts = {},
        keys = { { "-", "<CMD>Oil<CR>", desc = "Open parent directory" }, { "<leader>o", "<CMD>Oil<CR>" } },
    },

    -- TELESCOPE (Fuzzy finder)
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local actions = require("telescope.actions")
            require("telescope").setup({
                pickers = {
                    find_files = {
                        theme = "dropdown",
                        previewer = false, -- Hide preview for just this picker
                    },
                    buffers = {
                        theme = "dropdown",
                    },
                    live_grep = { preview = false },
                    oldfiles = { preview = false },
                },
                defaults = {
                    path_display = { "smart" },
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-u>"] = false, -- Disable default (scroll up) to allow clear line
                            ["<C-w>"] = { "<c-s-w>", type = "command" }, -- Map to clear word
                        },
                    },
                },
            })
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<C-p>', builtin.git_files, {desc='find git files'})
            vim.keymap.set('n', '<leader>/', builtin.live_grep, {desc='live grep'})
            vim.keymap.set('n', '<leader>fb', builtin.current_buffer_fuzzy_find, { desc = '[F]ind in current [b]uffer' })
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc='[f]ind [f]iles'})
            vim.keymap.set('n', '<leader>fm', builtin.man_pages, {desc='[f]ind [m]an pages'})
            vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {desc='[f]ind [o]ld files'})
            vim.keymap.set('n', '<leader>fs', builtin.grep_string, {desc='grep [s]tring under cursor'})
            vim.keymap.set('n', '<leader>fh', builtin.command_history, { desc = '[f]ind command in [h]istory' })
            vim.keymap.set('n', '<leader><leader>', builtin.buffers, {desc='find open buffers'})
        end
    },

    -- SYNTAX (Treesitter)
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "java", "lua", "vimdoc" }, -- Automatically installs java and other parsers
            highlight = {
                enable = true, -- Enable Treesitter highlighting
            },
            indent = {
                enable = true, -- Enable Treesitter indentation (optional)
            },
        },
        config = function()
            -- Modern Treesitter highlighting is enabled by default or via this simple call
            -- We no longer require('nvim-treesitter.configs') as it is deprecated/removed
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    pcall(vim.treesitter.start)
                end,
            })
        end
    },




    -- EDITING
    { "kylechui/nvim-surround", opts = {} },

    -- -- AI
    -- {
        --     "awslabs/amazonq.nvim",
        --     opts = { ssoStartUrl = 'https://view.awsapps.com/start' }
        -- },

        -- LSP MANAGEMENT
        {
            "williamboman/mason.nvim",
            config = function()
                require("mason").setup()
                local r = require("mason-registry")
                if not r.is_installed("pyright") then vim.cmd("MasonInstall pyright") end
            end
        },


        {
            "mfussenegger/nvim-jdtls",
            dependencies = { "williamboman/mason.nvim" },
        }


    })

    -- ========================================================================== --
    --  4. NATIVE LSP CONFIG (Neovim 0.11+ Registry)
    -- ========================================================================== --

    -- Register Pyright without nvim-lspconfig
    vim.lsp.config["pyright"] = {
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/pyright-langserver", "--stdio" },
        root_markers = { "pyproject.toml", "setup.py", "requirements.txt", ".git" },
        filetypes = { "python" },
        settings = {
            python = {
                analysis = {
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                    typeCheckingMode = "basic",
                },
            },
        },
    }

    -- LSP logic
    vim.lsp.config["lua_ls"] = {
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/lua-language-server" },
        filetypes = { "lua" },
    }

    -- Enable Pyright
    vim.lsp.enable("pyright", "lua_ls")

    -- LSP Keybindings
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            local opts = { buffer = args.buf, silent = true }
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K",  vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "<leader>lf", function() vim.diagnostic.open_float() end, opts)
        end,
    })


    -- vim.lsp.config["tsserver"] = {
        --     cmd = {"/local/home/aaryab/.local/share/mise/installs/node/18.20.2/bin/tsserver"},
        --     filetypes = {"javascript", "typescript"}
        -- }
        -- vim.lsp.enable("tsserver")
        --

        -- 1. Define the configuration for the TypeScript server
        -- In Neovim 0.11+
        vim.lsp.config('ts_ls', {
            -- Use the wrapper binary provided by the typescript-language-server package
            cmd = { "typescript-language-server", "--stdio" },
            filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
            root_markers = { 'tsconfig.json', 'package.json', '.git' },
            -- This tells the server where to find your specific Node/TS installation if needed
            init_options = {
                hostInfo = "neovim",
                tsserver = {
                    path = "/local/home/aaryab/.local/share/mise/installs/node/18.20.2/lib/node_modules/typescript/lib/tsserver.js"
                }
            }
        })

        vim.lsp.enable('ts_ls')


        -- ========================================================================== --
        --  5. KEYBINDINGS & ABBREVIATIONS
        -- ========================================================================== --

        -- Config Management
        vim.keymap.set("n", "<leader>ve", function() vim.cmd.edit(vim.env.MYVIMRC) end)
        vim.keymap.set("n", "<leader>vi", "<CMD>Lazy install<CR>")
        vim.keymap.set("n", "<leader>vp", "<CMD>Lazy<CR>")
        vim.keymap.set("n", "<leader>vl", "<CMD>checkhealth lsp<CR>")
        vim.keymap.set("n", "<leader>vm", "<CMD>Mason<CR>")

        -- Basic navigation & Utility
        vim.keymap.set("i", "kj", "<Esc>")
        vim.keymap.set("n", "<leader>s", ":w<CR>")
        vim.keymap.set("n", "<leader>q", ":q<CR>")
        vim.keymap.set("n", "<leader>hl", ":set invhlsearch<CR>")

        -- Quickfix/Buffer Navigation (Migrated from your [q, [b logic)
        vim.keymap.set("n", "[q", ":cprev<CR>")
        vim.keymap.set("n", "]q", ":cnext<CR>")
        vim.keymap.set("n", "[b", ":bprev<CR>")
        vim.keymap.set("n", "]b", ":bnext<CR>")

        -- Indentation (Keeps selection)
        vim.keymap.set("v", ">", ">gv")
        vim.keymap.set("v", "<", "<gv")

        -- Move lines
        vim.keymap.set("n", "<leader>k", ":m .-2<CR>==")
        vim.keymap.set("n", "<leader>j", ":m .+1<CR>==")
        vim.keymap.set("v", "<leader>k", ":m '<-2<CR>gv=gv")
        vim.keymap.set("v", "<leader>j", ":m '>+1<CR>gv=gv")

        -- Abbreviations
        vim.cmd([[iabbrev @@ aarya.bhatia1678@gmail.com]])
        vim.cmd([[iabbrev iferr if err != nil { return err }]])

        -- ========================================================================== --
        --  6. AUTOCOMMANDS
        -- ========================================================================== --
        local augroup = vim.api.nvim_create_augroup("GeminiUserGroup", { clear = true })

        -- Return to last edit position
        vim.api.nvim_create_autocmd("BufReadPost", {
            group = augroup,
            callback = function()
                local mark = vim.api.nvim_buf_get_mark(0, '"')
                if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(0) then
                    vim.api.nvim_win_set_cursor(0, mark)
                end
            end,
        })

        -- Filetype Specifics
        vim.api.nvim_create_autocmd("FileType", {
            group = augroup,
            pattern = { "markdown", "text" },
            callback = function()
                vim.opt_local.wrap = true
            end,
        })

        vim.api.nvim_create_autocmd("FileType", {
            group = augroup,
            pattern = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
            callback = function()
                vim.cmd[[ setlocal ts=2 sts=2 sw=2 et ]]
            end,
        })

        vim.api.nvim_create_autocmd("FileType", {
            group = augroup,
            pattern = { "python" },
            callback = function()
                vim.keymap.set("n", "<leader>F", ":%!black -q -<CR>", { buffer = true })
            end,
        })

        -- Only set the global Smart Format if leader-F isn't already assigned
        if vim.fn.maparg("<leader>F", "n") == "" then
            vim.keymap.set("n", "<leader>F", function()
                local clients = vim.lsp.get_clients({ bufnr = 0 })
                local can_format = false

                for _, client in ipairs(clients) do
                    if client.server_capabilities.documentFormattingProvider then
                        can_format = true
                        break
                    end
                end

                if can_format then
                    vim.lsp.buf.format({ async = true })
                    vim.notify("Formatted with LSP")
                else
                    local view = vim.fn.winsaveview()
                    vim.cmd("normal! gg=G")
                    vim.fn.winrestview(view)
                    vim.notify("Re-indented with Treesitter")
                end
            end, { desc = "Smart Format Fallback" })
        end

        -- Diary Template
        vim.api.nvim_create_autocmd("BufNewFile", {
            group = augroup,
            pattern = "*/diary/*.md",
            callback = function()
                local date = os.date("%Y-%m-%d")
                vim.api.nvim_buf_set_lines(0, 0, 1, false, { "# " .. date })
            end,
        })





        -- 1. The Bemol Function (Refined for workspace management)
        local function bemol()
            local bemol_dir = vim.fs.find({ '.bemol' }, { upward = true, type = 'directory' })[1]
            if not bemol_dir then return end

            local ws_folders_lsp = {}
            local file = io.open(bemol_dir .. '/ws_root_folders', 'r')
            if file then
                for line in file:lines() do
                    table.insert(ws_folders_lsp, line)
                end
                file:close()
            end

            for _, path in ipairs(ws_folders_lsp) do
                vim.lsp.buf.add_workspace_folder(path)
            end
        end


        vim.api.nvim_create_autocmd("FileType", {
            pattern = "java",
            callback = function()
                local jdtls = require("jdtls")
                local home = os.getenv("HOME")
                local java_21_bin = "/usr/lib/jvm/java-21-amazon-corretto/bin/java"

                -- 1. Root Detection
                local root_dir = require("jdtls.setup").find_root({ "packageInfo", "Config", ".git", "pom.xml" })
                if not root_dir or root_dir == "" then
                    root_dir = vim.fn.getcwd()
                end

                -- 2. Workspace Setup
                local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
                local eclipse_workspace = home .. "/.local/share/eclipse/" .. project_name

                -- 3. Bemol Integration (FOLDER LISTING)
                local ws_folders_jdtls = {}
                local bemol_file = root_dir .. "/.bemol/ws_root_folders"
                local f = io.open(bemol_file, "r")
                if f then
                    for line in f:lines() do
                        -- We use file:// prefix here as requested by your internal spec
                        table.insert(ws_folders_jdtls, "file://" .. line)
                    end
                    f:close()
                end

                -- 4. Paths to Mason JDTLS internals
                local mason_path = home .. "/.local/share/nvim/mason/packages/jdtls"
                local launcher_jar = vim.fn.glob(mason_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
                local os_config = vim.fn.has("mac") == 1 and "mac" or "linux"

                local config = {
                    cmd = {
                        java_21_bin,
                        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                        "-Dosgi.bundles.defaultStartLevel=4",
                        "-Declipse.product=org.eclipse.jdt.ls.core.product",
                        "-Dlog.protocol=true",
                        "-Dlog.level=ALL",
                        "-Xmx1g",
                        "--add-modules=ALL-SYSTEM",
                        "--add-opens", "java.base/java.util=ALL-UNNAMED",
                        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
                        "-jar", launcher_jar,
                        "-configuration", mason_path .. "/config_" .. os_config,
                        "-data", eclipse_workspace,
                    },
                    root_dir = root_dir,
                    init_options = {
                        -- This handles all the Bemol folders on startup
                        workspaceFolders = ws_folders_jdtls,
                    },
                    on_attach = function(client, bufnr)
                        -- REMOVED: bemol() call. It was causing the "already part of workspace" loop.

                        local opts = { buffer = bufnr, silent = true }
                        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

                        -- Only notify once
                        vim.notify("JDTLS Attached for " .. project_name)
                    end,
                }

                jdtls.start_or_attach(config)
            end,
        })


        vim.api.nvim_create_autocmd("FileType", {
            pattern = "qf",
            callback = function()
                local opts = { buffer = true }
                vim.keymap.set("n", "dd", ":.Reject<CR>", opts)
                vim.keymap.set("n", "[[", ":colder<CR>", opts)
                vim.keymap.set("n", "]]", ":cnewer<CR>", opts)
            end
        })


        local view_group = vim.api.nvim_create_augroup("ViewManagement", { clear = true })
        vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
            group = view_group,
            pattern = "?*",
            command = "silent! mkview",
        })

        vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
            group = view_group,
            pattern = "?*",
            command = "silent! loadview",
        })

        vim.api.nvim_create_autocmd({"BufReadPost", "BufNewFile"}, {
            pattern = "Config",
            callback = function()
                vim.cmd("setf brazil-config")
            end
        })


        -- Modern consistency
        vim.keymap.set("n", "Y", "y$", { desc = "Yank to end of line" })
        vim.keymap.set("x", "p", '"_dP', { desc = "Paste without yanking" })

        -- Search/Selection
        vim.keymap.set("n", "<leader>pw", "ciw<C-r>0<Esc>", { desc = "Replace word with yanked" })
        vim.keymap.set("n", "<leader>V", "V`]", { desc = "Select pasted text" })

        -- Quickfix controls
        vim.keymap.set("n", "<leader>co", "<cmd>copen<cr>")
        vim.keymap.set("n", "<leader>cc", "<cmd>cclose<cr>")

        -- System
        vim.keymap.set("n", "<leader>W", "<cmd>TrimTrailingSpaces<CR>", { desc = "Trim Whitespace" })


        -- Enable OSC52 Clipboard (Works over SSH/Tmux)
        if vim.fn.has('nvim-0.10') == 1 then
            vim.g.clipboard = {
                name = 'OSC 52',
                copy = {
                    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
                    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
                },
                paste = {
                    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
                    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
                },
            }
        end

        -- Keybinding to make it easy (consistent with your old config)
        vim.keymap.set({'n', 'v'}, '<leader>y', '"+y', { desc = 'Yank to System Clipboard (OSC52)' })
        vim.keymap.set('n', '<leader>yy', '"+yy', { desc = 'Yank line to System Clipboard (OSC52)' })

        -- vim.cmd[[colorscheme retrobox]]

        -- You could also define a ~/.config/nvim/lsp/barium.lua file, see :h lsp-config
        vim.lsp.config.barium = {
            cmd = { 'barium' },
            root_markers = { 'Config' },
            filetypes = { 'brazil-config' },
        }

        -- Enable Barium
        vim.lsp.enable("barium")

        vim.keymap.set('n', 'gK', function()
            local new_config = not vim.diagnostic.config().virtual_lines
            vim.diagnostic.config({ virtual_lines = new_config })
        end, { desc = 'Toggle diagnostic virtual_lines' })

        vim.cmd[[tnoremap <Esc> <C-\><C-n>]]

        local function copy_file_path(type)
            -- 'p' gives the absolute path, '.' gives the path relative to the current working directory
            local path = vim.fn.expand(type == "relative" and "%:." or "%:p")
            vim.fn.setreg("+", path)
            print("Copied path: " .. path)
        end

        -- Keymaps
        vim.keymap.set("n", "<leader>yf", function() copy_file_path("absolute") end, { desc = "Copy absolute file path" })
        vim.keymap.set("n", "<leader>yr", function() copy_file_path("relative") end, { desc = "Copy relative file path" })


        local jump_to_alternate = function()
            local current_file = vim.fn.expand("%:t:r") -- Get filename without extension
            local target = ""

            if current_file:match("Test$") then
                -- We are in a test, look for source
                target = current_file:gsub("Test$", "")
            else
                -- We are in source, look for test
                target = current_file .. "Test"
            end

            local builtin = require('telescope.builtin')
            builtin.find_files({
                prompt_title = "Jump to Alternate",
                default_text = target, -- Pre-fills the search with the name
                select_stat = true,    -- If there's only one match, it won't auto-open (safer)
            })
        end

        vim.keymap.set('n', '<leader>ga', jump_to_alternate, { desc = '[G]o to [A]lternate' })
