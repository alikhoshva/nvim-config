return {
  {
    "nvim-dap",
    auto_enable = true,
    after = function()
      local dap = require('dap')
      
      -- Adapter for C++
      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "-i", "dap" }
      }

      -- Mapping: Step Into (Like F11 in VS)
      vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'Debug: Step Into' })
    end
  }
}
