autoload -Uz compinit
compinit # completions

setopt nobeep autocd  # cd using only name of dir

PS1=' %F{180} %1d ~ ' # prompt color

export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagaced
 
alias ll='ls -lG'


if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

#alias tr='tree -L 3 -I "node_modules|*.md|babel.config.js|*.json"'
alias esh='v ~/code/shell_scripts/*'       # edit shell scripts 

alias kdl='rm -r ~/Downloads/*'       # klear Downloads
alias rmds='rm .DS_Store'

# cd
alias h='cd'                          # cd into home dir
alias b='cd -'                        # cd into previous dir
alias u='cd ..'                       # go up 1 dir
alias d='cd ~/Desktop'                # cd into Desktop
alias dl='cd ~/Downloads'             # cd into Downloads
alias c='cd ~/code'                   # cd into code/
alias dot='cd ~/.dotfiles'            # cd into .dotfiles

alias cn='cd ~/code/node'             # cd into node/
alias cnt='cd ~/code/net'             # cd into net/ (netlify)
alias pw='cd ~/code/pwa'              # cd into pwa/
alias cs='cd ~/code/css'              # cd into css
alias cj='cd ~/code/js'               # cd into js
alias cv='cd ~/code/vue'              # cd into vue
alias cvn='cd ~/code/vue/nuxt'        # cd into nuxt

alias course='cd ~/code/cpp/course'   # cd into c++ course
alias serial='cd ~/code/vue/nuxt/serial' # cd into serial
alias resume='cd ~/code/vue/nuxt/resume' # cd into resume

# git
alias g='git add . && git commit -m "." && git push -u origin main'
alias gs='git status'
alias gp='git push origin main'
alias gpl='git pull --quiet'
alias gb='git rev-parse --abbrev-ref HEAD' # show current branch

alias gph='git push heroku main'
alias ght='cd ~/code && cat ghpat.txt && b'

# node
alias nvmcmnds='cat ~/code/node/nvm-commands.txt' # nvm commands
alias pkg='v package.json'
alias rmn='rm -r node_modules'        # rm node_modules
alias ns='npm start'
alias ni='npm install'
alias nci='npm ci'                    # install all dependencies
alias nrs='npm run serve'             # vue dev server
alias nrd='npm run dev'               # nuxt dev server
alias nrb='npm run build'             # build vue project
alias nrg='npm run generate'          # nuxt generate static
alias nuxtwf='cat ~/code/vue/nuxt/workflow.txt'  # cat nuxt workflow

alias nif='npm install fsevents'
alias nt='npm test'
alias op='v test/* app.js controllers/* routes/* models/* middleware/*' 

# netlify
alias ntd='netlify dev'
alias ntdl='netlify dev --live'
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
alias sz='source ~/.zshrc'            # source .zshrc
alias vz='v ~/.zshrc'                 # open .zshrc with vim
alias vv='v ~/.vimrc'                 # open .vimrc with vim
alias vh='vim -c help -c only'        # open vim help
alias ds='du -sh * | sort -rn'        # see disk space 
alias ej='find /Volumes -maxdepth 1 -not -user root -print0 | xargs -0 diskutil eject'
alias ls='gls --group-directories-first'
alias p='python'
alias n='node'
alias activate='source venv/bin/activate'
alias chrome='open -a /Applications/Google\ Chrome.app'
alias postman='open -a /Applications/Postman.app'

# cpp
alias gc='g++ -std=c++2a -o ./m ./main.cpp'  # g++ compile main.cpp to m
     # or use -std=gnu++2a  for 'C++ 2020 with GNU extensions' std

# nvm
export NVM_DIR="$HOME/.nvm"

# This loads nvm:
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  

# This loads nvm bash_completion:
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  

