return {
  -- Core DAP
  {
    "mfussenegger/nvim-dap",
    dependencies = { "jay-babu/mason-nvim-dap.nvim" },
    config = function()
      local dap = require("dap")

      -- Path to cpptools adapter installed by Mason
      local mason_path = vim.fn.stdpath("data") .. "/mason"
      local adapter_path = mason_path .. "/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7"

      dap.adapters.cppdbg = {
        id = "cppdbg",
        type = "executable",
        command = adapter_path,
      }

      local function get_program()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end

      dap.configurations.cpp = {
        {
          name = "Launch with gdb",
          type = "cppdbg",
          request = "launch",
          program = get_program,
          cwd = "${workspaceFolder}",
          stopAtEntry = false,
          args = {},

          -- gdb-specific settings
          MIMode = "gdb",
          miDebuggerPath = vim.fn.exepath("gdb"), -- uses your installed gdb
          setupCommands = {
            {
              text = "-enable-pretty-printing",
              description = "Enable GDB pretty printing",
              ignoreFailures = true,
            },
          },
        },
      }

      -- Reuse for C as well
      dap.configurations.c = dap.configurations.cpp
    end,
  },

  -- Mason DAP integration: auto-install cpptools (needed for cppdbg)
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = { "cpptools" },
      automatic_installation = true,
    },
  },

  -- Optional but highly recommended: DAP UI
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local dap = require("dap")
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
    end,
  },
}

