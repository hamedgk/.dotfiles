

-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerCompile',
})


return require('packer').startup(function(use)
  -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    -- Snippet completion source for nvim-cmp
    use 'hrsh7th/cmp-vsnip'

    -- Other usefull completion sources
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
 
    use 'simrat39/rust-tools.nvim'

    -- Snippet engine
    use 'hrsh7th/vim-vsnip'


   --Debugging
    use 'nvim-lua/plenary.nvim'
    use 'mfussenegger/nvim-dap'
    use "EdenEast/nightfox.nvim" -- Packer


    --Telescope
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

