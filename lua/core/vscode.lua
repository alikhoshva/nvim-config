-- =============================================================================
-- VSCode Neovim Extension Configuration
-- =============================================================================
-- This file is loaded ONLY when running inside VSCode Neovim.
-- It bypasses heavy plugins, and provides lightweight options and keymaps
-- integrated with native VSCode commands.

-- 1. Leader Keys Setup
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Helper to safely call VSCode commands asynchronously
local vscode = require('vscode')
local function action(cmd_id)
  return function()
    vscode.action(cmd_id)
  end
end

-- 2. Basic Options (Optimized for VSCode)
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight' })

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep Neovim yank/paste registers perfectly synced with VSCode and System clipboard
vim.opt.clipboard = 'unnamedplus'

-- 3. Ported Core Neovim Keymaps (From lua/core/keymaps.lua)

-- Move visual selections up/down easily
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { silent = true, desc = 'Moves Selection Down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { silent = true, desc = 'Moves Selection Up' })

-- Smooth scrolling with screen centering
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll Down and Center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll Up and Center' })

-- Keep search results centered in viewport
vim.keymap.set('n', 'n', 'nzz', { desc = 'Next Search Result' })
vim.keymap.set('n', 'N', 'Nzz', { desc = 'Previous Search Result' })

-- Explicit system clipboard bindings (Only paste-over remains, as +y is handled by clipboard=unnamedplus)
vim.keymap.set('x', '<leader>P', '"_dP', { noremap = true, silent = true, desc = 'Paste over selection (No clobber)' })


-- 4. VSCode Command Integrations (Leader Key Bindings)

-- File Search & Navigation
vim.keymap.set('n', '<leader>f', action('workbench.action.quickOpen'), { desc = 'Find files (QuickOpen)' })
vim.keymap.set('n', '<leader>sg', action('workbench.action.findInFiles'), { desc = 'Search in files (Ripgrep)' })
vim.keymap.set('n', '<leader>e', action('workbench.action.toggleSidebarVisibility'), { desc = 'Toggle sidebar' })
vim.keymap.set('n', '<leader>cp', action('workbench.action.showCommands'), { desc = 'Command palette' })

-- Language Server Protocol (LSP) & Code actions
vim.keymap.set('n', '<leader>r', action('editor.action.rename'), { desc = 'Rename symbol' })
vim.keymap.set('n', '<leader>ca', action('editor.action.quickFix'), { desc = 'Code action / Quick fix' })
vim.keymap.set('n', 'gd', action('editor.action.revealDefinition'), { desc = 'Go to definition' })
vim.keymap.set('n', 'gr', action('editor.action.goToReferences'), { desc = 'Find references' })
vim.keymap.set('n', '<leader>d', action('editor.action.showHover'), { desc = 'Show hover' })

-- Git navigation inside VSCode
vim.keymap.set('n', ']c', action('workbench.action.editor.nextChange'), { desc = 'Jump to next git change' })
vim.keymap.set('n', '[c', action('workbench.action.editor.previousChange'), { desc = 'Jump to previous git change' })

-- Editor Split & Pane Navigation
vim.keymap.set('n', '<leader>wd', action('workbench.action.closeActiveEditor'), { desc = 'Close active editor split' })
vim.keymap.set('n', '<leader>w/', action('workbench.action.splitEditor'), { desc = 'Split editor right' })
vim.keymap.set('n', '<leader>w-', action('workbench.action.splitEditorOrthogonal'), { desc = 'Split editor down' })

-- Standard Vim Split Window Navigation using Ctrl+w (Aligns with VSCode Native Ctrl+H/J/K/L)
vim.keymap.set('n', '<C-w>h', action('workbench.action.focusLeftGroup'), { desc = 'Focus left split' })
vim.keymap.set('n', '<C-w>l', action('workbench.action.focusRightGroup'), { desc = 'Focus right split' })
vim.keymap.set('n', '<C-w>k', action('workbench.action.focusAboveGroup'), { desc = 'Focus above split' })
vim.keymap.set('n', '<C-w>j', action('workbench.action.focusBelowGroup'), { desc = 'Focus below split' })
