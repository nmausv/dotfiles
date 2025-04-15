local dap = require('dap')
require("nvim-dap-virtual-text").setup()


dap.adapters.lldb = {
  type = 'executable',
  command = '$(brew --prefix llvm)/bin/lldb-vscode', -- adjust as needed, must be absolute path
  name = 'lldb'
}

dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command = '/Users/nmaus/.codelldb/extension/adapter/codelldb',
    args = { "--port", "${port}" },

    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}

local default = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

dap.configurations.c = default

dap.configurations.rust = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. '/', 'file')
    end,
    args = function()
      return { vim.fn.input('Arguments: ') }
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,

    -- rust specifics start here
    initCommands = function()
      -- Find out where to look for the pretty printer Python module.
      local rustc_sysroot = vim.fn.trim(vim.fn.system 'rustc --print sysroot')
      assert(
        vim.v.shell_error == 0,
        'failed to get rust sysroot using `rustc --print sysroot`: '
        .. rustc_sysroot
      )
      local script_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py'
      local commands_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_commands'

      -- The following is a table/list of lldb commands, which have a syntax
      -- similar to shell commands.
      --
      -- To see which command options are supported, you can run these commands
      -- in a shell:
      --
      --   * lldb --batch -o 'help command script import'
      --   * lldb --batch -o 'help command source'
      --
      -- Commands prefixed with `?` are quiet on success (nothing is written to
      -- debugger console if the command succeeds).
      --
      -- Prefixing a command with `!` enables error checking (if a command
      -- prefixed with `!` fails, subsequent commands will not be run).
      --
      -- NOTE: it is possible to put these commands inside the ~/.lldbinit
      -- config file instead, which would enable rust types globally for ALL
      -- lldb sessions (i.e. including those run outside of nvim). However,
      -- that may lead to conflicts when debugging other languages, as the type
      -- formatters are merely regex-matched against type names. Also note that
      -- .lldbinit doesn't support the `!` and `?` prefix shorthands.
      return {
        ([[command script import '%s']]):format(script_file),
        ([[command source '%s']]):format(commands_file),
      }
    end,
    -- ...,
  },
}



vim.keymap.set('n', '<Leader>dc', function() require('dap').continue() end)
vim.keymap.set('n', '<Leader>s', function() require('dap').step_over() end)
vim.keymap.set('n', '<Leader>si', function() require('dap').step_into() end)
vim.keymap.set('n', '<Leader>so', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp',
  function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)

require('dapui').setup()

vim.keymap.set('n', '<Leader>dt', function() require('dapui').toggle() end)
