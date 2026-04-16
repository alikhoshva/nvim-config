return {
  {
    "nvim-dap",
    auto_enable = true,
    on_plugin = function()
      local dap = require('dap')
      -- Adapter for C++
      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "-i", "dap" }
      }
    end,
  },
  {
    "nvim-dap-view",
    auto_enable = true,
    after = { "nvim-dap" },
    on_plugin = function()
      require("dap-view").setup({})
    end,
  },
}
