(fn lazy_load_plugins [use]
  ; This (not fzf.vim) is the core plugin, not doing post-hook install here
  (use {1 :junegunn/fzf
        :cmd ["FZF"]})
  (use {1 :mcchrish/nnn.vim
        :cmd ["NnnPicker"]})
  ; TODO consider alternates like zk
  (use {1 :vimwiki/vimwiki
        :keys ["<leader>ww"]})
  (use {1 :tpope/vim-abolish
        :cmd ["Abolish" "Subvert"]})
  (use {1 :tpope/vim-fugitive
        :cmd ["G"]})
  (use {1 "kristijanhusak/vim-dadbod-completion"
        :after [:nvim-cmp :vim-dadbod]
        :requires [ {1 "tpope/vim-dadbod"
                     :ft ["sql"]
                     :config "require('conf-vim-dadbod')"} ]
        })
  (use {1 :tpope/vim-rsi
        :event ["InsertEnter *" "CmdlineEnter *"]})
  ; Used primarily for async grep,
  ; TODO replace this mainly due to it supporting only one job
  ; with vim-grepper / Dispatch itself when it supports grep
  (use {1 :skywind3000/asyncrun.vim
        :cmd ["AsyncRun"]})
  (use {1 :tpope/vim-dispatch
        :config "require('conf-dispatch')"
        :cmd ["Dispatch" "Make" "Focus" "Start"]})
  (use {1 :tpope/vim-commentary
        :keys ["gc" "gcc"]})
  ; only for ft=lang based stuff, for now only elixir
  (use {1 :ajayvigneshk/neoterm
        :ft ["elixir"]
        :config "require('conf-neoterm')"})
  (use {1 :vim-test/vim-test
        :ft ["elixir"]
        :config "require('conf-vim-test')"})
  (use {1 :tpope/vim-projectionist
        :ft ["elixir"]})
  (use {1 :AndrewRadev/splitjoin.vim
        :ft ["elixir"]})
  (use {1 :gpanders/fennel-repl.nvim
        :cmd ["FennelRepl"]})
  )
((. (require :packer) :startup)
 (fn [use]
   (do
     (use :wbthomason/packer.nvim)
     (use :rktjmp/hotpot.nvim)
     (lazy_load_plugins use)
     (use :lifepillar/vim-solarized8)
     (use :itchyny/lightline.vim)
     (use :machakann/vim-sandwich)
     (use :tpope/vim-unimpaired)
     (use :tpope/vim-repeat)
     (use :tpope/vim-sensible)
     (use :jamessan/vim-gnupg)
     (use :neovim/nvim-lspconfig) ;cannot be made opt
     (use {1 :hrsh7th/nvim-cmp
           :config "require('conf-nvim-cmp')"
           :event "InsertEnter *"
           :requires [
                      :hrsh7th/cmp-nvim-lsp ; cannot be made opt
                      {1 :L3MON4D3/LuaSnip
                       :after :nvim-cmp
                       :requires [ {1 :rafamadriz/friendly-snippets
                                    :after :LuaSnip
                                    :config "require('luasnip.loaders.from_vscode').load()"} ]
                       :config "require('conf-luasnip')"}
                      {1 :saadparwaiz1/cmp_luasnip
                       :after  :nvim-cmp}
                      ]})
     ; Plugins that have after/ftplugin themselves
     ; Might not be able to do opt
     ; (use :nvim-treesitter/nvim-treesitter-textobjects)
     ; (use {1 :nvim-treesitter/nvim-treesitter
     ;       :do :TSUpdate})
     (use :elixir-editors/vim-elixir)
     ; (use :fatih/vim-go)
     (use {1 :bakpakin/fennel.vim
           :ft ["fennel"]})
     )))
