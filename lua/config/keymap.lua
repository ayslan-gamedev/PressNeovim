vim.g.mapleader = " "

local km = vim.keymap


-- save
--km.set('n', '<leader>s', ':w<CR>', { noremap = true, silent = true })


-- windows management
km.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })                   -- split window vertically
km.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })                 -- split window horizontally
km.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })                    -- make split windows equal width & height
km.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })               -- close current split window

km.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })                     -- open new tab
km.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })              -- close current tab
km.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })                     --  go to next tab
km.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })                 --  go to previous tab
km.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new ta:wb

km.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { silent = true })                                -- move selected code to line up
km.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { silent = true })                              -- move selected code to line down
