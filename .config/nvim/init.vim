set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.config/nvim/vim-plug/plugins.vim
source ~/.vimrc

"commands:
"  :PlugUpdate   (for all plugins)
"  :PlugUpgrade  (for vim-plug itself)
"  :PlugInstall
"  :PlugClean    (to remove plugins no longer defined in plugins.vim)
"  :PlugStatus
"
