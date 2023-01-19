(fn lazy_load_plugins [use]
  (use {1 :junegunn/fzf
        :fn ["fzf#vim#complete"]
        :cmd [:FZF]
        })
  ; hopefully for temporary reasons
  (use {1 :junegunn/fzf.vim
        :fn ["fzf#vim#complete"]
        ; [tip][packer] syntax: it's NOT :junnegunn/fzf but :fzf in after 
        :after [:fzf]
        :requires [:junegunn/fzf]
        })
  (use {1 :mcchrish/nnn.vim
        :cmd ["NnnPicker"]})
  ; TODO consider alternates like zk
  (use {1 :vimwiki/vimwiki
        :keys ["<leader>ww"]})
  (use {1 :tpope/vim-abolish
        :cmd ["Abolish" "Subvert"]
        :keys ["cr"]})
  (use {1 :tpope/vim-fugitive
        :event ["VimEnter" "DirChanged"]
        ; syntax equivalent of vim.fn["git#WithinGitDir"]() = 1 hence the double ()
        ; this calls vim function within lua
        :cond (fn [] (= ((. vim.fn "git#WithinGitDir")) 1))
        })
  (use {1 :shumphrey/fugitive-gitlab.vim
        :after [:vim-fugitive]})
  (use {1 :junegunn/gv.vim
        :after [:vim-fugitive]})
  ; This is very buggy especially opening it (refer github issues)
  (use {1 :sodapopcan/vim-twiggy
        :after [:vim-fugitive]})
  (use {1 "kristijanhusak/vim-dadbod-completion"
        :after [:nvim-cmp :vim-dadbod]
        :requires [{1 "tpope/vim-dadbod"
                    :ft ["sql"]
                    :config "require('conf-vim-dadbod')"}]
        })
  (use {1 :tpope/vim-rsi
        :event ["InsertEnter *" "CmdlineEnter *"]})
  (use {1 :tmsvg/pear-tree
        :event ["InsertEnter *" "CmdlineEnter *"]})
  ; Used primarily for async grep, and quickfix toggling
  (use {1 :skywind3000/asyncrun.vim})
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
  (use {1 :AndrewRadev/switch.vim
        :ft ["elixir"]})
  (use {1 "tpope/vim-obsession"
        :cmd ["Obsession"]
        })
  (use {1 :gpanders/fennel-repl.nvim
        :cmd ["FennelRepl"]})
  (use {1 :mbbill/undotree
        :cmd ["UndotreeToggle"]})
  (use {1 :tpope/vim-eunuch
        :cmd ["Delete" "Unlink" "Move" "Rename" "Chmod" "Mkdir" "Cfind" "Clocate" "Lfind" "Wall" "SudoWrite" "SudoEdit"]})
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
                      {1 :hrsh7th/cmp-buffer
                       :after  :nvim-cmp}
                      ]})
     ; Plugins that have after/ftplugin themselves
     ; Might not be able to do opt
     (use {1 :nvim-treesitter/nvim-treesitter-context})
     (use {1 :nvim-treesitter/nvim-treesitter-textobjects})
     (use {1 :nvim-treesitter/nvim-treesitter
           :do :TSUpdate})
     (use :elixir-editors/vim-elixir)
     ; (use :fatih/vim-go)
     (use {1 :bakpakin/fennel.vim
           :ft ["fennel"]})
     )))
