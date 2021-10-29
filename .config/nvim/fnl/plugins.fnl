((. (require :packer) :startup)
  (fn [use]
    (do
      (use :wbthomason/packer.nvim)
      (use :rktjmp/hotpot.nvim)
      (use :junegunn/fzf); This (not fzf.vim) is the core plugin, not doing post-hook install here
      (use :mcchrish/nnn.vim)
      (use :lifepillar/vim-solarized8)
      (use :itchyny/lightline.vim)
      (use :machakann/vim-sandwich)
      (use :tpope/vim-unimpaired)
      (use :tpope/vim-repeat)
      (use :tpope/vim-sensible)
      (use :skywind3000/asyncrun.vim)
      (use :jamessan/vim-gnupg)
      (use :vimwiki/vimwiki)
      (use :machakann/vim-highlightedyank)
      (use :hrsh7th/vim-vsnip)
      (use :hrsh7th/vim-vsnip-integ)
      (use :tpope/vim-rsi)
      (use :tpope/vim-abolish)
      (use :tpope/vim-commentary)
      (use :tpope/vim-fugitive)
      (use :bakpakin/fennel.vim)
      ; todo
      ; lazy load
      ; couldn't do it
      (use :neovim/nvim-lspconfig)
      (use :hrsh7th/nvim-cmp)
      (use :hrsh7th/cmp-nvim-lsp)
      (use :hrsh7th/cmp-vsnip)
      (use :nvim-treesitter/nvim-treesitter-textobjects)
      (use {1 :nvim-treesitter/nvim-treesitter
            :do :TSUpdate})
      ; ft specific plugins
      (use :elixir-editors/vim-elixir)
      (use :fatih/vim-go)
      )))
