-- Sets
vim.cmd.colorscheme "oxocarbon-lua"
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- LUALINE
require"lualine".setup({
  options = {
    theme = "horizon" 
  }
})

-- TREESITTER
require"nvim-treesitter.configs".setup {
  auto_install = true,
  sync_install = false,
  highlight = {
    enable = true
  }
}
 
-- TELESCOPE
require("telescope").setup()
local builtin = require("telescope.builtin")

-- LSP
local lspconfig = require("lspconfig")
local cmp = require("cmp")

lspconfig.clangd.setup {}
lspconfig.pyright.setup {}
lspconfig.tsserver.setup {}
lspconfig.rust_analyzer.setup {}

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  
  window = { 
    completion = cmp.config.window.bordered()
  },
   
  mapping = cmp.mapping.preset.insert({
    ["<C-z>"] = cmp.mapping.abort(),
    ["<ENTER>"] = cmp.mapping.confirm({select = true}),
  }),

  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip"},
  }, {
    {name = "buffer"},
  })
})

cmp.setup.cmdline({"/", "?"}, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    {name = "buffer"}
  }
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    {name = "path"}
  }, {
    {name = "cmdline"}
  })
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig")["nvim_lsp"].setup {
  capabilities = capabilities
}

-- Remaps
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>zz", vim.cmd.Ex)
vim.keymap.set("n", "<leader>fs", builtin.find_files, {})

-- Configurations
vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
