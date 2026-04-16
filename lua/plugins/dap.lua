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
    end
  },
  {
        "igorlfs/nvim-dap-view",
        -- let the plugin lazy load itself
        lazy = false,
        version = "1.*",
        ---@module 'dap-view'
        ---@type dapview.Config
        opts = {},
    },
}
