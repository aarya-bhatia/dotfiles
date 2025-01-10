local jdtls = require("jdtls")
-- local on_attach = require("me.lsp").on_attach -- change to yours

local root_dir = require("jdtls.setup").find_root({ "packageInfo" }, "Config")
local home = os.getenv("HOME")
local eclipse_workspace = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local ws_folders_jdtls = {}
if root_dir then
 local file = io.open(root_dir .. "/.bemol/ws_root_folders")
 if file then
  for line in file:lines() do
   table.insert(ws_folders_jdtls, "file://" .. line)
  end
  file:close()
 end
end

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    '/opt/homebrew/bin/jdtls',

    -- 💀
    -- '/Users/aaryab/Library/Java/JavaVirtualMachines/corretto-1.8.0_432/Contents/Home/jre/bin/java', -- or '/path/to/java17_or_newer/bin/java'
            -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    -- 💀
    -- '-jar', '/opt/homebrew/Cellar/jdtls/1.43.0/libexec/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar',
          -- '/path/to/jdtls_install_location/plugins/org.eclipse.equinox.launcher_VERSION_NUMBER.jar',
         -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
         -- Must point to the                                                     Change this to
         -- eclipse.jdt.ls installation                                           the actual version


    -- 💀
    -- '-configuration', '/opt/homebrew/Cellar/jdtls/1.43.0/libexec/config_mac',
    -- '/path/to/jdtls_install_location/config_SYSTEM',
                    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
                    -- Must point to the                      Change to one of `linux`, `win` or `mac`
                    -- eclipse.jdt.ls installation            Depending on your system.

    -- '--jvm-arg=-javaagent:' .. home .. '/Developer/lombok.jar', -- need for lombok magic

    -- 💀
    -- See `data directory configuration` section in the README
    '-data', eclipse_workspace -- '/path/to/unique/per/project/workspace/folder'
  },

  -- 💀
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  --
  -- vim.fs.root requires Neovim 0.10.
  -- If you're using an earlier version, use: require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
  root_dir = vim.fs.root(0, {".git", "mvnw", "gradlew", "packageInfo"}),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
      configuration = {
        -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
        -- And search for `interface RuntimeOption`
        -- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
        runtimes = {
          -- {name = "JAVASE_21", path = "/Library/Java/JavaVirtualMachines/amazon-corretto-21.jdk/Contents/Home/", },
          -- {name = "JavaSE_17", path = "/Library/Java/JavaVirtualMachines/amazon-corretto-17.jdk/Contents/Home/", },
          -- {name = "JavaSE_11", path = "/Library/Java/JavaVirtualMachines/amazon-corretto-11.jdk/Contents/Home/", },
          -- {name = "JavaSE_1_8", path = "/Users/aaryab/Library/Java/JavaVirtualMachines/corretto-1.8.0_432/Contents/Home/", },
        }
      }
    }
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {}
  },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
