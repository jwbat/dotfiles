autoload -Uz compinit
compinit # completions

setopt nobeep autocd  # cd using only name of dir

alias allow='chmod 744'                     # set permission
PS1=" %F{220} %1d ~ "
export LSCOLORS=gafxcxdxfaegedabagacad
 
compinit -d ~/.dump

export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/Applications/CMake.app/Contents/bin":"$PATH"
export PATH="/bin:$PATH"
export PATH="$PATH:$HOME/code/shell/scripts"

alias pth='echo $PATH'

alias ll='ls -lG'

alias grep='ggrep -P'                       # Perl grep


#if command -v pyenv 1>/dev/null 2>&1; then
  #eval "$(pyenv init -)"
#fi

alias lss='ls ~/code/shell/scripts'         # ls scripts
alias lscp='ls ~/code/cpp/*/'              # ls cpp
alias lsa='ls /Volumes/Andromeda'           # ls volume andromeda
alias ka='sudo rm -r /Volumes/Andromeda/*'  # clear volume andromeda
alias k='clear'                             # clear console
alias kdl='rm -r ~/Downloads/*'             # clear Downloads
alias rmds='rm .DS_Store'

# git
alias g='git add . && git commit -m "." && git push -u origin main'
alias gpl='git pull --rebase --quiet'
alias gs='git status'
alias gp='git push origin main'
alias gb='git rev-parse --abbrev-ref HEAD' # show current branch

alias gph='git push heroku main'
alias ght='cat ~/code/gh.txt'
alias gitcommands='cat ~/code/commands/git.txt'

# cd
alias o='cd ~/code'                         # code
alias dot='cd ~/.dotfiles'                  # .dotfiles
alias dnv='cd ~/.config/nvim'               # .config/nvim
alias dv='cd ~/.vim'                        # .vim
alias rp='cd ~/code/repos'                  # repos
alias d='cd ~/Desktop'                      # Desktop
alias dl='cd ~/Downloads'                   # Downloads
alias scr='cd ~/code/shell/scripts'         # scripts
alias ulb='cd /usr/local/bin'               # /usr/local/bin
alias pdfs='cd ~/pdfs'            # pdfs
alias h='cd'                                # home
alias b='cd -'                              # previous
alias u='cd ..'                             # go up 1

alias cpl='cd ~/code/cpp'                   # cpp
alias cutil='cd ~/code/cpp/utilities'       # cpp utilities
alias cpsh='cd ~/code/cpp/utilities/shell'  # cpp shell utils
alias fp='cd ~/code/cpp/functional_cpp'     # functional_cpp
alias py='cd ~/code/python'                 # python
alias cn='cd ~/code/node'                   # node
alias cnt='cd ~/code/net'                   # netlify
alias cj='cd ~/code/js'                     # js
alias cv='cd ~/code/vue'                    # vue
alias cvn='cd ~/code/vue/nuxt'              # nuxt

alias c1='cd ~/code/cpp/courses/design_patterns' # design patterns in cpp
alias qt1='cd ~/code/cpp/courses/qt1'       # qt1
alias num='cd ~/code/cpp/courses/numerical' # numerical
alias serial='cd ~/code/vue/nuxt/serial'    # serial
alias resume='cd ~/code/vue/nuxt/resume'    # resume

# cats
alias bsh='cat ~/.dotfiles/.snippets/.bash.txt'
alias brw='cat ~/.dotfiles/.snippets/.brew.txt'

# misc. 
alias ls='gls -aX --group-directories-first'
#alias ls='ls -aX'
alias sz='source ~/.zshrc'                  # source .zshrc
alias ds='du -sh * | sort -rn'              # see disk space 
alias ej='find /Volumes -maxdepth 1 -not -user root -print0 | xargs -0 diskutil eject'

# node
alias nvmcmnds='cat ~/code/node/nvm-commands.txt' # nvm commands
alias pkg='v package.json'
alias rmn='rm -r node_modules'              # rm node_modules
alias ns='npm start'
alias ni='npm install'
alias nci='npm ci'                          # install all dependencies
#alias nrs='npm run serve'                   # vue dev server
alias nrd='npm run dev'                     # nuxt dev server
alias nrb='npm run build'                   # build vue project
alias nrg='npm run generate'                # nuxt generate static
alias nuxtwf='cat ~/code/vue/nuxt/workflow.txt'  # cat nuxt workflow

alias nif='npm install fsevents'
alias nt='npm test'
alias op='v test/* app.js controllers/* routes/* models/* middleware/*' 

# netlify
alias ntd='netlify dev'
#alias ntdl='netlify dev --live'
alias ntdp='netlify deploy'
alias nth='netlify help'

# vue
alias ov='v main.js App.vue pages/* components/*/* composables/*'
alias va='v *.js *.vue `find . -type f`'

# nuxt
alias or='v pages/*.vue components/*.vue layouts/**/*.vue nuxt.config.js'  # resume project
alias on='v store/*.js pages/*.vue components/*.vue layouts/**/*.vue plugins/*.js nuxt.config.js'  
alias onu='v store/*.js pages/**/*.vue components/**/*.vue layouts/**/*.vue middleware/*.js assets/**/*.css api/*.js nuxt.config.js'

# firebase
alias fbs='firebase serve'
alias fdf='firebase deploy --only functions'

# vim
alias v='~/nvim-osx64/bin/nvim'       # neovim
alias nv='~/.config/nvim/pack'        # plugins live here
alias vz='v ~/.zshrc'                 # open .zshrc with vim
alias vv='v ~/.vimrc'                 # open .vimrc with vim
alias vh='vim -c help -c only'        # open vim help

# python
alias p='python3.9'                   # manage versions with pyenv
alias n='node'
alias activate='source venv/bin/activate'
alias chrome='open -a /Applications/Google\ Chrome.app'
alias postman='open -a /Applications/Postman.app'

# cpp
alias c='g++ -std=c++20 *.cpp -o ./m'                   # gcc compile
#alias c='g++ -std=c++20 *.cpp -o ./m'                   # gcc compile
alias gc='g++ -std=c++20 -I Headers Source/* -o ./m'    # 
#-std=c++2a 
alias vc='v main.cpp'                                   # open main.cpp 
alias vf='v main.cpp *.h *.cpp'                         # "v flat"
alias vn='v */main.cpp */*'                             # "v nested"
alias create-cpp='p ~/code/shell_scripts/create_cpp.py'     # mkdir Headers Source/main.cpp
alias m='./m'                                           # run compiled cpp file
alias cm='c && m'                                       # compile and run ./m
alias rmm='rm */m'

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"        # load nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # load nvm bash_completion

