-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("i", "<S-Enter>", "<C-y>")

keymap.set("n", "<leader>q", "<cmd>bd<CR>", { desc = "Delete buffer" })
keymap.set("n", "<leader>bn", "<cmd>bn<CR>", { desc = "Next buffer" })
keymap.set("n", "<leader>bp", "<cmd>bp<CR>", { desc = "Previous buffer" })
