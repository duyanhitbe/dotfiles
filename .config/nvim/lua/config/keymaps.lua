local cinnamon = require("cinnamon")

-- Internal
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true, desc = "Clear search highlights" })
vim.keymap.set("n", "<leader>qq", "<cmd>q!<CR>", { silent = true, desc = "Force quit" })
vim.keymap.set("n", "<leader>qa", "<cmd>qwa<CR>", { silent = true, desc = "Save all and quit" })
vim.keymap.set("n", "<leader>ww", "<cmd>w<CR>", { silent = true, desc = "Save" })
vim.keymap.set("n", "<leader>wa", "<cmd>wa<CR>", { silent = true, desc = "Save all" })
vim.keymap.set("n", "<C-e>", function() cinnamon.scroll("5<C-e>") end, { silent = true, desc = "Smooth scroll down 5 lines" })
vim.keymap.set("n", "<C-y>", function() cinnamon.scroll("5<C-y>") end, { silent = true, desc = "Smooth scroll up 5 lines" })
vim.keymap.set({ 'n', 'x' }, '<M-c>', '"+y', { noremap = true, silent = true, desc = 'Copy to clipboard' })

-- Move current line up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { silent = true, desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { silent = true, desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selection up" })

-- Comment selected lines
vim.keymap.set("x", "<C-_>", [[:s/^/# /<CR>:noh<CR>]], { noremap = true, silent = true, desc = "Comment selection" })

-- Comment current line
vim.keymap.set("n", "<C-_>", [[:s/^/# /<CR>:noh<CR>]], { noremap = true, silent = true, desc = "Comment line" })

-- Uncomment
vim.keymap.set({ "n", "x" }, "<C-?>", [[:s/^# //<CR>:noh<CR>]], { noremap = true, silent = true, desc = "Uncomment line(s)" })

-- Move like arrow keys in insert mode
vim.keymap.set("i", "<A-h>", "<Left>",  { silent = true })
vim.keymap.set("i", "<A-j>", "<Down>",  { silent = true })
vim.keymap.set("i", "<A-k>", "<Up>",    { silent = true })
vim.keymap.set("i", "<A-l>", "<Right>", { silent = true })

-- Stay in visual mode when indenting
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

-- Split
vim.keymap.set("n", "<leader>|", "<cmd>vsplit<CR>", { silent = true, desc = "Split vertically" })
vim.keymap.set("n", "<leader>-", "<cmd>split<CR>", { silent = true, desc = "Split horizontally" })

-- Neotree
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { silent = true, desc = "Toggle file explorer" })

-- Telescope
vim.keymap.set("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { silent = true, desc = "Find files" })
vim.keymap.set("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", { silent = true, desc = "Live grep" })

-- Buffer
vim.keymap.set("n", "<leader>bd", "<CMD>bd<CR>", { silent = true, desc = "Close current buffer" })
vim.keymap.set("n", "<S-n>", "<CMD>bnext<CR>", { silent = true, desc = "Next buffer" })
vim.keymap.set("n", "<S-p>", "<CMD>bprev<CR>", { silent = true, desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bo", "<CMD>BufferLineCloseOthers<CR>", { silent = true, desc = "Close other buffer" })

-- LSP
local function optimize_import()
	vim.lsp.buf.code_action({
		apply = true,
		context = {
			only = { "source.removeUnused" },
			diagnostics = {},
		},
	})
end
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { silent = true, desc = "Go to definition" })
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { silent = true, desc = "Go to reference" })
vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { silent = true, desc = "Go to implementation" })
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { silent = true, desc = "Code action" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { silent = true, desc = "Hover" })
vim.keymap.set("n", "<leader>i", vim.lsp.buf.format, { silent = true, desc = "Format" })
vim.keymap.set("n", "<leader>o", optimize_import, { silent = true, desc = "Optimize import" })

-- Lazy tools
vim.keymap.set("n", "<leader>lg", "<CMD>LazyGit<CR>", { silent = true, desc = "Open LazyGit" })
vim.keymap.set("n", "<leader>ll", "<CMD>Lazy<CR>", { silent = true, desc = "Open LazyVim" })

-- Debugger
vim.keymap.set('n', '<leader>dc', function() require('dap').continue() end, { silent = true, desc = "Debug" })
vim.keymap.set('n', '<leader>dn', function() require('dap').step_over() end, { silent = true, desc = "Step over" })
vim.keymap.set('n', '<leader>di', function() require('dap').step_into() end, { silent = true, desc = "Step into" })
vim.keymap.set('n', '<leader>do', function() require('dap').step_out() end, { silent = true, desc = "Step out" })
vim.keymap.set('n', '<leader>db', function() require('dap').toggle_breakpoint() end, { silent = true, desc = "Toggle breakpoint" })
vim.keymap.set({'n', 'v'}, '<leader>dh', function() require('dap.ui.widgets').hover() end, { silent = true, desc = "Debug hover" })
vim.keymap.set({'n', 'v'}, '<leader>dp', function() require('dap.ui.widgets').preview() end, { silent = true, desc = "Debug preview" })
vim.keymap.set('n', '<leader>du', function() require("dapui").toggle() end, { silent = true, desc = "Open debug UI" })

-- Git
vim.keymap.set('n', '<leader>gv', "<CMD>DiffviewOpen<CR>", { silent = true, desc = "Open diff view" })
vim.keymap.set('n', '<leader>gc', "<CMD>DiffviewClose<CR>", { silent = true, desc = "Close diff view" })
vim.keymap.set('n', '<leader>gh', "<CMD>DiffviewFileHistory<CR>", { silent = true, desc = "Open file history" })
vim.keymap.set('n', '<leader>gxn', "<CMD>GitConflictNextConflict<CR>", { silent = true, desc = "Move to the next conflict" })
vim.keymap.set('n', '<leader>gxp', "<CMD>GitConflictPrevConflict<CR>", { silent = true, desc = "Move to the previous conflict" })
vim.keymap.set('n', '<leader>gxo', "<CMD>GitConflictChooseOurs<CR>", { silent = true, desc = "Select the current changes" })
vim.keymap.set('n', '<leader>gxt', "<CMD>GitConflictChooseTheirs<CR>", { silent = true, desc = "Select the incoming changes" })
vim.keymap.set('n', '<leader>gxb', "<CMD>GitConflictChooseBoth<CR>", { silent = true, desc = "Select both changes" })
vim.keymap.set('n', '<leader>gxz', "<CMD>GitConflictChooseNone<CR>", { silent = true, desc = "Select none of the changes" })
vim.keymap.set('n', '<leader>gxl', "<CMD>GitConflictListQf<CR>", { silent = true, desc = "Get all conflict to quickfix" })
