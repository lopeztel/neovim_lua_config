local dap = require('dap')
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  -- Assuming cpptools has been installed through Mason:
  command = '/home/lopeztel/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
}
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function ()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
    linux = {
      MIMode = 'gdb',
      miDebuggerPath = '/usr/bin/gdb',
    },
    setupCommands = {
      {
        description = "Enable pretty printing",
        text = '-enable-pretty-printing',
        ignoreFailures = false,
      },
      {
        description = "Stop at exit",
        text = 'catch exit',
        ignoreFailures = true,
      },
      {
        description = "Stop at unhandled exceptions",
        text = 'catch exception unhandled',
        ignoreFailures = true,
      },
    },
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = "launch",
    linux = {
      MIMode = 'gdb',
      miDebuggerServerAddress='localhost:1234',
      miDebuggerPath = '/usr/bin/gdb',
    },
    setupCommands = {
      {
        description = "Enable pretty printing",
        text = '-enable-pretty-printing',
        ignoreFailures = false,
      },
      {
        description = "Stop at exit",
        text = 'catch exit',
        ignoreFailures = true,
      },
      {
        description = "Stop at unhandled exceptions",
        text = 'catch exception unhandled',
        ignoreFailures = true,
      },
    },
    cwd = '${workspaceFolder}',
    program = function ()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}
dap.adapters.coreclr = {
  type = 'executable',
  -- Assuming netcoredbg has been installed through Mason:
  command = '/home/lopeztel/.local/share/nvim/mason/packages/netcoredbg/netcoredbg',
  args = {'--interpreter=vscode'}
}
dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
  },
}

-- .vscode/launch.json file support
require('dap.ext.vscode').load_launchjs()

-- launch dapui automagically
local dapui = require("dapui")
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dapui.close()
-- end

require("nvim-dap-virtual-text").setup()

vim.fn.sign_define('DapBreakpoint',{ text ='', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapBreakpointCondition',{ text ='', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})
