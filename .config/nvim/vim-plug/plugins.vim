" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Declare the list of plugins.
    Plug 'tpope/vim-sensible'
    
    " Themes
    Plug 'junegunn/seoul256.vim'
    Plug 'phanviet/vim-monokai-pro'
    Plug 'sainnhe/gruvbox-material'
    "
    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'

call plug#end()


"commands:
"  :PlugUpdate   (for all plugins)
"  :PlugUpgrade  (for vim-plug itself)
"  :PlugInstall
"  :PlugClean    (to remove plugins no longer defined in plugins.vim)
"  :PlugStatus
"
