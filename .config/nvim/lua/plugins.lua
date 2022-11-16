-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

vim.cmd [[packadd packer.nvim]]
require("packer").startup(function()
    use 'wbthomason/packer.nvim'

    use "williamboman/mason.nvim"
    use 'williamboman/mason-lspconfig.nvim'
    use "neovim/nvim-lspconfig"
    use 'jose-elias-alvarez/null-ls.nvim'
    use "jayp0521/mason-null-ls.nvim"

    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/vim-vsnip"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-cmdline"

    use 'arcticicestudio/nord-vim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }
    use {
        'andymass/vim-matchup',
        setup = function()
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end,
        requires = { 'nvim-treesitter/nvim-treesitter' }
    }
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end,
        requires = { 'nvim-treesitter/nvim-treesitter' }
    }
    use {
        'numToStr/Comment.nvim',
        requires = { 'nvim-treesitter/nvim-treesitter' }
    }
    use 'kylechui/nvim-surround'
    use 'lewis6991/gitsigns.nvim'
    use 'dinhhuy258/git.nvim'
end)
