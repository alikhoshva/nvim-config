return {
	{
		"nvim-dap",
		auto_enable = true,
		after = function(plugin)
			local dap = require("dap")
			dap.adapters.gdb = {
				type = "executable",
				command = "gdb",
				args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
			}
		end,
	},
	{
		"nvim-dap-view",
		auto_enable = true,
	},
}
