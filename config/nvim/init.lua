-- Create by VietPQ

-- Setup Neovim
vim.opt.number = true   -- Display line numbers
vim.opt.wrap = false    -- Disable wrap line
vim.opt.sidescroll = 1  -- Scroll 1-char horizontally
vim.opt.sidescrolloff = 5   -- Keep 5-char margin
-- Set tab = 4 space
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
-- Setup color
vim.opt.termguicolors = true


-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Import your plugins here
local plugins = {
    -- Dracula Theme
    {
        "Mofiqul/dracula.nvim", name = "dracula", priority = 1000,
    },
    -- Dashboard nvim
    {
        "nvimdev/dashboard-nvim",
        event = 'VimEnter',
        dependencies = { {'nvim-tree/nvim-web-devicons'}},
    },
    -- Lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    -- Telescope
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        'nvim-telescope/telescope-ui-select.nvim',
        -- FZF
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make'
        }
    },
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter", build = ":TSUpdate"
    },
    -- Neo-tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    },
    -- LSPconfig
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    -- Null_LS
    {
        "jose-elias-alvarez/null-ls.nvim",
    },
    -- Autocomplete
    {
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        dependencies = {
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
        },
        "hrsh7th/cmp-nvim-lsp",
    },
}

-- Configure any other settings here. See the documentation for more details.
local opts = {
    -- Colorscheme that will be used when installing plugins.
    install = { colorscheme = { "dracula" } },
    -- Automatically check for plugin updates
    checker = { enabled = true },
}

-- Setup lazy.nvim
require("lazy").setup(plugins, opts)

-- Setup dracula theme
require("dracula").setup({
    transparent_bg = true,  -- Set transparent background
    italic_comment = true,  -- Set italic comment
})
vim.cmd.colorscheme "dracula"   -- Set dracula theme

-- Setup dashboard-nvim
require('dashboard').setup({
    theme = 'doom',
    config = {
        -- header = { "VIET-VIM" },
        header = {
            '',
            '',
            '',
            '██╗   ██╗██╗███████╗████████╗   ███╗   ██╗██╗   ██╗██╗███╗   ███╗',
            '██║   ██║██║██╔════╝╚══██╔══╝   ████╗  ██║██║   ██║██║████╗ ████║',
            '██║   ██║██║█████╗     ██║█████╗██╔██╗ ██║██║   ██║██║██╔████╔██║',
            '╚██╗ ██╔╝██║██╔══╝     ██║╚════╝██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║',
            ' ╚████╔╝ ██║███████╗   ██║      ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║',
            '  ╚═══╝  ╚═╝╚══════╝   ╚═╝      ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝',
            ' Have a great time with Viet-Nvim!!!',
            '',
            '',
        },
        center = {
            {
                icon = '  ',
                icon_hl = 'Title',
                desc = 'New File               ',
                desc_hl = 'String',
                key = 'n',
                action = 'lua vim.cmd("ene")'
            },
            {
                icon = '  ',
                icon_hl = 'Title',
                desc = 'Find File               ',
                desc_hl = 'String',
                key = 'f',
                action = 'lua vim.cmd("cd ~/ | silent Telescope find_files hidden=true no_ignore=true")'
            },
            {
                icon = '  ',
                icon_hl = 'Title',
                desc = 'Find Text               ',
                desc_hl = 'String',
                key = 't',
                action = 'lua vim.cmd("Telescope live_grep")'
            },
            {
                icon = '  ',
                icon_hl = 'Title',
                desc = 'Settings               ',
                desc_hl = 'String',
                key = 's',
                action = 'lua vim.cmd("e ~/.config/nvim/init.lua")'
            },
            {
                icon = '  ',
                icon_hl = 'Title',
                desc = 'Update Plugins               ',
                desc_hl = 'String',
                key = 'u',
                action = 'lua vim.cmd("Lazy update")'
            },
            {
                icon = '󰒲  ',
                icon_hl = 'Title',
                desc = 'Lazy               ',
                desc_hl = 'String',
                key = 'l',
                action = 'lua vim.cmd("Lazy")'
            },
            {
                icon = '⏻  ',
                icon_hl = 'Title',
                desc = 'Quit               ',
                desc_hl = 'String',
                key = 'q',
                action = 'lua vim.cmd("qa")'
            },
        },
        footer = {
            "",
            "  GitHub: https://github.com/vietpq685",
        },
    }
})

-- Setup lualine
require("lualine").setup({
    options = {
        theme = 'dracula',
        icons_enabled = true,
    }
})

-- Setup telescope
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
require("telescope").setup({
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
                -- even more opts
            }
        },
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        }
    },
})
require("telescope").load_extension("fzf")
require("telescope").load_extension("ui-select")

-- Setup treesitter
local config = require("nvim-treesitter.configs")
config.setup({
    ensure_installed = { "lua", "c", "cpp", "python", "javascript", "java" },
    highlight = { enable = true },
    indent = { enable = true },
})

-- Setup neo-tree
require("neo-tree").setup({
    source_selector = {
        winbar = false,
        statusline = false,
    },
    filesystem = {
        filtered_items = {
            visible = true, -- Show hidden file
            hide_dotfiles = false, -- Show dotfile
            hide_gitignored = true, -- Show git ignore file
        },
    },
    window = {
        width = 25, -- Set width window neotree (default 40)
    },
})
vim.keymap.set('n', '<C-E>', ':Neotree filesystem reveal<CR>', {})

-- Setup lspconfig
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "clangd", "pyright", "ts_ls" }, -- Lua, C/C++, Python, JavaScript
})
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
    capabilities = capabilities,
})
lspconfig.clangd.setup({
    capabilities = capabilities,
})
lspconfig.pyright.setup({
    capabilities = capabilities,
})
lspconfig.ts_ls.setup({
    capabilities = capabilities,
})

vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

-- Setup null-ls
local null_ls = require("null-ls")
null_ls.setup({
    source = {
        null_ls.builtins.formatting.stylua, -- Lua
        null_ls.builtins.formatting.clang_format, -- C/C++
        null_ls.builtins.formatting.black, -- Python
        null_ls.builtins.formatting.prettier, -- JavaScript
    }
})
vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})

-- Setup autocomplete
require("luasnip.loaders.from_vscode").lazy_load()
local cmp = require'cmp'
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        -- { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    })
})
