local opts = { noremap = true, silent = false }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":Lex 30<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
-- keymap("n", "<A-k>", ":m -2<CR>", opts)
-- keymap("n", "<A-j>", ":m +1<CR>", opts)

-- Insert --
-- Press jk fast to exit insert mode 
-- keymap("i", "jk", "<ESC>", opts)
-- keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Custom --
-- Ctrl-s to save (remember to change .bash_profile)
keymap("n", "<C-s>", ":w<CR>", opts) --save
keymap("i", "<C-s>", "<Esc>:w<CR>", opts)

-- Navigation
-- keymap("i", "C-h", "<Left>", opts)
-- keymap("i", "C-j", "<Down>", opts)
-- keymap("i", "C-k", "<Up?", opts)
-- keymap("i", "C-l", "<Right>", opts)
keymap("i", "hz", "<Left>", opts)
keymap("i", "zh", "<Left>", opts)
keymap("i", "jz", "<Down>", opts)
keymap("i", "zj", "<Down>", opts)
keymap("i", "kz", "<Up>", opts)
keymap("i", "zk", "<Up>", opts)
keymap("i", "lz", "<Right>", opts)
keymap("i", "zl", "<Right>", opts)

-- Nvchad toggle line numbers
-- keymap("n", "<Leader>n", "<cmd> set nu! <CR>", opts) -- toggle line number
-- keymap("n", "<eader>rn", "<cmd> set rnu! <CR>", opts) -- toggle relative number

keymap("n", "<ESC>", ":noh<CR>", opts) --no highlight
keymap("n", "<leader>x", ":BufDel<CR>", opts) --delete buffer (not closing window)

-- nvimtree
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts) --toggle nvimtree
keymap("n", "<leader>e", ":NvimTreeFocus<CR>", opts) --focus nvimtree

---------------------------------------------------------------
--Nvchad archive
---------------------------------------------------------------
-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using <cmd> :map
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
-- ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
-- ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
-- ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
-- ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
---------------------------------------------------------------
-- M.telescope = {
--   plugin = true,
--
--   n = {
--     -- find
--     ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "find files" },
--     ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
--     ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
--     ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
--     ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "help page" },
--     ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
--     ["<leader>tk"] = { "<cmd> Telescope keymaps <CR>", "show keys" },
--
--     -- git
--     ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
--     ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "git status" },
--
--     -- pick a hidden term
--     ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "pick hidden term" },
--
--     -- theme switcher
--     ["<leader>th"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },
--   },
-- }
---------------------------------------------------------------
-- M.lspconfig = {
--   plugin = true,
--
--   -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions
--
--   n = {
--     ["gD"] = {
--       function()
--         vim.lsp.buf.declaration()
--       end,
--       "lsp declaration",
--     },
--
--     ["gd"] = {
--       function()
--         vim.lsp.buf.definition()
--       end,
--       "lsp definition",
--     },
--
--     ["K"] = {
--       function()
--         vim.lsp.buf.hover()
--       end,
--       "lsp hover",
--     },
--
--     ["gi"] = {
--       function()
--         vim.lsp.buf.implementation()
--       end,
--       "lsp implementation",
--     },
--
--     ["<leader>ls"] = {
--       function()
--         vim.lsp.buf.signature_help()
--       end,
--       "lsp signature_help",
--     },
--
--     ["<leader>D"] = {
--       function()
--         vim.lsp.buf.type_definition()
--       end,
--       "lsp definition type",
--     },
--
--     ["<leader>ra"] = {
--       function()
--         require("nvchad_ui.renamer").open()
--       end,
--       "lsp rename",
--     },
--
--     ["<leader>ca"] = {
--       function()
--         vim.lsp.buf.code_action()
--       end,
--       "lsp code_action",
--     },
--
--     ["gr"] = {
--       function()
--         vim.lsp.buf.references()
--       end,
--       "lsp references",
--     },
--
--     ["<leader>f"] = {
--       function()
--         vim.diagnostic.open_float()
--       end,
--       "floating diagnostic",
--     },
--
--     ["[d"] = {
--       function()
--         vim.diagnostic.goto_prev()
--       end,
--       "goto prev",
--     },
--
--     ["d]"] = {
--       function()
--         vim.diagnostic.goto_next()
--       end,
--       "goto_next",
--     },
--
--     ["<leader>q"] = {
--       function()
--         vim.diagnostic.setloclist()
--       end,
--       "diagnostic setloclist",
--     },
--
--     ["<leader>fm"] = {
--       function()
--         vim.lsp.buf.format { async = true }
--       end,
--       "lsp formatting",
--     },
--
--     ["<leader>wa"] = {
--       function()
--         vim.lsp.buf.add_workspace_folder()
--       end,
--       "add workspace folder",
--     },
--
--     ["<leader>wr"] = {
--       function()
--         vim.lsp.buf.remove_workspace_folder()
--       end,
--       "remove workspace folder",
--     },
--
--     ["<leader>wl"] = {
--       function()
--         print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--       end,
--       "list workspace folders",
--     },
--   },
-- }
