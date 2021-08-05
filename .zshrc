autoload -Uz compinit
compinit # completions

setopt nobeep autocd  # cd using only the name of the dir

PS1=' %F{180} %1d ~ ' # tan prompt

export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagaced
 
# alias ls='ls -G'
alias ll='ls -lG'


if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

#alias tr='tree -L 3 -I "node_modules|*.md|babel.config.js|*.json"'
alias esh='v ~/code/shell_scripts/*'       # edit shell scripts 
#.........................................................................
#.........................................................................

#                           -- thumbdrive --
# ------------------------------------------------------------------------

alias znuxt='cp -r code/vue/nuxt/course/blog /Volumes/Andromeda'
alias zbnuxt='cp -r /Volumes/Andromeda/blog code/vue/nuxt/course/'

alias z='python ~/code/shell_scripts/vz_to_andromeda.py'    # .vimrc & .zshrc to A
alias zb='python ~/code/shell_scripts/vz_from_andromeda.py' #    "        " from A 

alias zs='cp -r ~/code/shell_scripts /Volumes/Andromeda'    # cp shell_scripts to A
alias zbs='cp -r /Volumes/Andromeda/shell_scripts ~/code'   # cp      "    " from A 

alias zvue='cp -r ~/code/vue /Volumes/Andromeda'   # cp vue to A
alias zbvue='cp -r /Volumes/Andromeda/vue ~/code'   # cp vue from A

alias lsa='ls /Volumes/Andromeda'          # ls Andromeda
alias ka='rm -r /Volumes/Andromeda/*'      # klear A of everything
alias kdl='rm -r ~/Downloads/*'             # klear out Downloads
alias rmds='rm .DS_Store'

alias znt='cp -r ~/code/net /Volumes/Andromeda'                     # cp net to A
alias zbnt='cp -r /Volumes/Andromeda/net ~/code'                    # cp net from A

alias zc='cp -r ~/code/css /Volumes/Andromeda'                      # cp css to A
alias zbc='cp -r /Volumes/Andromeda/css ~/code'                     # cp css from A

#.........................................................................
#  -- open --

# open pwa
alias opw='v index.html sw.js src/css/* src/js/*'  

# open nodejs project  
alias o='v app.js controllers/* routes/* models/* middleware/*'  
# open frontend
alias of='v index.html css/* *.js modules/*'

#.........................................................................
# -- cd fast -- 

alias pj='cd ~/code/vue/nuxt/serial' # cd into current project
alias el='cd ~/code/vue/projects/element' # cd into element project
alias cv='cd ~/code/vue'              # cd into vue
alias cvn='cd ~/code/vue/nuxt'        # cd into nuxt
alias cvj='cd ~/code/vue/projects'    # cd into vue projects
alias cvc='cd ~/code/vue/course'      # cd into vue course
alias l='cd ~/code/node/projects/list-api'  # cd into list-api
alias fl='cd ~/code/net/list-project/dist' # cd to net/ list-project/dist 

alias h='cd'                          # cd into home dir
alias b='cd -'                        # cd into previous dir
alias u='cd ..'                       # go up 1 dir
alias d='cd ~/Desktop'                # cd into Desktop
alias dl='cd ~/Downloads'             # cd into Downloads
alias c='cd ~/code'                   # cd into code/
alias cn='cd ~/code/node'             # cd into node/
alias cnt='cd ~/code/net'             # cd into net/ (netlify)
alias pw='cd ~/code/pwa'              # cd into pwa/
alias cs='cd ~/code/css'              # cd into css
alias cj='cd ~/code/js'               # cd into js
#.........................................................................

# -- git --
alias gp='git push -u origin main'
alias gph='git push heroku main'
alias gpl='git pull --quiet'
alias ght='cd ~/code && cat ghpat.txt'

# -- node --

alias pkg='v package.json'
alias rmn='rm -r node_modules'        # rm node_modules
alias ns='npm start'
alias ni='npm install'
alias nci='npm ci'                    # install all dependencies
alias nrs='npm run serve'             # vue dev server
alias nrd='npm run dev'               # nuxt dev server
alias nrb='npm run build'             # build vue project

alias nif='npm install fsevents'
alias nt='npm test'
alias op='v test/* app.js controllers/* routes/* models/* middleware/*' 
#.........................................................................

# -- netlify --
alias ntd='netlify dev'
alias ntdl='netlify dev --live'
alias ntdp='netlify deploy'
alias nth='netlify help'

#.........................................................................
# -- react --
# open React project  
alias or='v src/App.js src/pages/Feed/Feed.js src/pages/Feed/SinglePost/SinglePost.js'

# -- vue --- nuxt ---------------------------------------------------------
# open Vue project  
alias ov='v main.js App.vue pages/* components/*/* composables/*'
alias va='v *.js *.vue `find . -type f`'

# open nuxt project
alias on='v store/*.js pages/*.vue components/*.vue layouts/**/*.vue assets/* plugins/*.js nuxt.config.js'  
alias onu='v store/*.js pages/**/*.vue components/**/*.vue layouts/**/*.vue middleware/*.js assets/**/*.css api/*.js nuxt.config.js'

#---------------------------------------------------------------------------
# -- firebase --
alias fbs='firebase serve'
alias fdf='firebase deploy --only functions'
#---------------------------------------------------------------------------
# open css course project
alias oc='v *.html *.css customers/* packages/* start-hosting/* *.js'


alias sz='source ~/.zshrc'            # source .zshrc
alias vz='v ~/.zshrc'                 # open .zshrc with vim
alias vv='v ~/.vimrc'                 # open .vimrc with vim
alias vh='vim -c help -c only'        # open vim help
alias ds='du -sh * | sort -rn'        # see disk space 
alias ej='find /Volumes -maxdepth 1 -not -user root -print0 | xargs -0 diskutil eject'
alias ls='gls --group-directories-first'
alias p='python'
alias n='node'
alias v='~/nvim-osx64/bin/nvim'
alias activate='source venv/bin/activate'
alias chrome='open -a /Applications/Google\ Chrome.app'
alias postman='open -a /Applications/Postman.app'


# --nvm----------------------------------------------------------
export NVM_DIR="$HOME/.nvm"

# This loads nvm:
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  

# This loads nvm bash_completion:
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  
# ----------------------------------------------------^-nvm-^----

            
