-------------------------
-- all plugins external
-- by arvo
--------------------------

local isOk, packer = pcall(require, 'packer')
if not isOk then
    print("Packer couldn't load, check it in $HOME/.config/nvim/lua/plugins.lua")
    return
end

-- floating packer
packer.init {
    display = {
        open_fn = function ()
            return require('packer.util').float {border='rounded'}
        end
    }
}


return packer.startup(
    function(use)
        -- package manager --
        use 'wbthomason/packer.nvim'

	    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

        -- colorschemes
        use 'sainnhe/gruvbox-material'
        use 'EdenEast/nightfox.nvim'
        use { "ellisonleao/gruvbox.nvim" }
        use 'RRethy/base16-nvim'

        -- LSP / language server protocol
        use 'neovim/nvim-lspconfig'
        use 'onsails/lspkind.nvim'
        use 'williamboman/mason.nvim'   -- LSP installer tool

        -- completion
        use "nvim-lua/plenary.nvim" -- all LUA functions they dont want to write twice
        use 'hrsh7th/cmp-nvim-lsp'  -- core
        use 'hrsh7th/cmp-buffer'    -- buffer completions
        use 'hrsh7th/cmp-path'      -- path completions
        use 'hrsh7th/cmp-cmdline'   -- cmdline completions
        use 'hrsh7th/cmp-nvim-lua'  -- source for neovim Lua API
        use 'hrsh7th/nvim-cmp'      -- completion plugin
        use {                       -- AI completions
            "supermaven-inc/supermaven-nvim",
            config = function()
            require("supermaven-nvim").setup({})
            end,
        }

        -- snippets
        use 'L3MON4D3/LuaSnip'
        use 'saadparwaiz1/cmp_luasnip'

        -- icons
        use 'kyazdani42/nvim-web-devicons'

        -- ntree file explorer
        use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } }

        -- lualine / bottom status icon
        use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

        -- colorizer / colorize the colors
        use 'NvChad/nvim-colorizer.lua'

        -- better tabs
        use { 'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'} }

        -- html / css front-end helper
        use 'mattn/emmet-vim'

        -- filetype and syntax plugin for LaTeX files
        use 'lervag/vimtex'

        -- customizable snippets for everything
        use 'SirVer/ultisnips'

    end
)
