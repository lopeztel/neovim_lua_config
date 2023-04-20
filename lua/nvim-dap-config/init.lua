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
    name = "Debug VPR",
    type = "cppdbg",
    request = "launch",
    program = function ()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    -- args = {'-L 1', '-Gvpr_all', '-ftests/C/vpr/clic_interrupt_en/clic_interrupt_en.hex' },
    args = {'-L 1', '-Gvpr_all', function ()
      return vim.fn.input('Path to FW: ', '-ftests/C/vpr/', 'file')
    end},
    cwd = '${workspaceFolder}',
    linux = {
      MIMode = 'gdb',
      miDebuggerPath = '/usr/bin/gdb',
    }
  },
  -- {
  --   name = "(gdb) Launch vpr",
  --   type = "cppdbg",
  --   request = "launch",
  --   program = function ()
  --     return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
  --   end,
  --   args = {'-d 1', '-L 1', '-Gvpr_inst', '-ftests/C/vpr/clic_interrupt_en/clic_interrupt_en.hex' },
  --   cwd = '${workspaceFolder}',
  -- },
}

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
