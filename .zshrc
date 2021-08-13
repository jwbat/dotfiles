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

alias z='python ~/code/shell_scripts/vz_to_andromeda.py'    # .vimrc & .zshrc to A
alias zb='python ~/code/shell_scripts/vz_from_andromeda.py' #    "        " from A 

alias zs='cp -r ~/code/shell_scripts /Volumes/Andromeda'    # cp shell_scripts to A
alias zbs='cp -r /Volumes/Andromeda/shell_scripts ~/code'   # cp      "    " from A 

alias lsa='ls /Volumes/Andromeda'          # ls Andromeda
alias ka='rm -r /Volumes/Andromeda/*'      # klear A of everything
alias kdl='rm -r ~/Downloads/*'             # klear out Downloads
alias rmds='rm .DS_Store'

#.........................................................................
# -- cd fast -- 

alias h='cd'                          # cd into home dir
alias b='cd -'                        # cd into previous dir
alias u='cd ..'                       # go up 1 dir
alias d='cd ~/Desktop'                # cd into Desktop
alias dl='cd ~/Downloads'             # cd into Downloads
alias c='cd ~/code'                   # cd into code/
alias dot='cd ~/.dotfiles'            # cd into code/

alias cn='cd ~/code/node'             # cd into node/
alias cnt='cd ~/code/net'             # cd into net/ (netlify)
alias pw='cd ~/code/pwa'              # cd into pwa/
alias cs='cd ~/code/css'              # cd into css
alias cj='cd ~/code/js'               # cd into js

alias pj='cd ~/code/vue/nuxt/serial' # cd into current project
alias cv='cd ~/code/vue'              # cd into vue
alias cvn='cd ~/code/vue/nuxt'        # cd into nuxt

# -- git --
alias g='git add . && git commit -m "-" && git push -u origin main' # 3-for-1
alias gp='git push -u origin main' # git push
alias gph='git push heroku main'   # git push heroku
alias gpl='git pull --quiet'       # git pull shhh
alias ght='cd ~/code && cat ghpat.txt && b'

# -- node --

alias pkg='v package.json'
alias rmn='rm -r node_modules'        # rm node_modules
alias ns='npm start'
alias ni='npm install'
alias nci='npm ci'                    # install all dependencies
alias nrs='npm run serve'             # vue dev server
alias nrd='npm run dev'               # nuxt dev server
alias nrb='npm run build'             # build vue project
alias nrg='npm run generate'          # nuxt generate static

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
alias on='v store/*.js pages/*.vue components/*.vue layouts/**/*.vue plugins/*.js nuxt.config.js'  
alias onu='v store/*.js pages/**/*.vue components/**/*.vue layouts/**/*.vue middleware/*.js assets/**/*.css api/*.js nuxt.config.js'

#---------------------------------------------------------------------------
# -- firebase --
alias fbs='firebase serve'
alias fdf='firebase deploy --only functions'
#---------------------------------------------------------------------------
# open css course project
alias oc='v *.html *.css customers/* packages/* start-hosting/* *.js'


alias v='~/nvim-osx64/bin/nvim'       # neovim
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


# --nvm----------------------------------------------------------
export NVM_DIR="$HOME/.nvm"

# This loads nvm:
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  

# This loads nvm bash_completion:
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  
# ----------------------------------------------------^-nvm-^----

