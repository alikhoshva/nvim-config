return {
  {
    "plenary.nvim",
    -- Tells lze to load this plugin as a dependency of yazi
    dep_of = { "yazi.nvim" }, 
  },
  {
    "yazi.nvim",
    -- Automatically disables the plugin if it's not installed via Nix
    auto_enable = true, 
    -- Use DeferredUIEnter for performance, similar to your other UI plugins
    event = "DeferredUIEnter",
    -- Replaces the 'init' block from your snippet
    before = function()
      -- Mark netrw as loaded to prevent conflicts
      vim.g.loaded_netrwPlugin = 1
    end,
    -- Replaces 'opts' and 'keys' by setting them up after the plugin loads
    after = function()
      require('yazi').setup({
        open_for_directories = false,
        keymaps = {
          show_help = "<f1>",
        },
      })

      -- Keybindings
      vim.keymap.set({ "n", "v" }, "<leader>-", "<cmd>Yazi<cr>", { desc = "Open yazi at the current file" })
      vim.keymap.set("n", "<leader>cw", "<cmd>Yazi cwd<cr>", { desc = "Open the file manager in nvim's working directory" })
      vim.keymap.set("n", "<c-up>", "<cmd>Yazi toggle<cr>", { desc = "Resume the last yazi session" })
    end
  },
}
