local dap = require('dap')
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  -- Assuming cpptools has been installed through Mason:
  -- command = '~/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
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
    -- args = {'-L 1', '-Gvpr_all', function ()
    --   return vim.fn.input('Path to FW: ', '-ftests/C/vpr/', 'file')
    -- end},
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
    linux = {
      MIMode = 'gdb',
      miDebuggerPath = '/usr/bin/gdb',
    }
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
    cwd = '${workspaceFolder}',
    program = function ()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}
dap.adapters.coreclr = {
  type = 'executable',
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
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

require("nvim-dap-virtual-text").setup()

vim.fn.sign_define('DapBreakpoint',{ text ='', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapBreakpointCondition',{ text ='', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})
