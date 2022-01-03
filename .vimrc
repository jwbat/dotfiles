syntax on
highlight Folded NONE 
highlight LineNr ctermfg=black
hi statusline none
hi statusline ctermbg=none
hi StatusLine ctermbg=0 cterm=none
hi StatusLineNC ctermbg=0 cterm=none
hi folded ctermbg=234
set tabpagemax=20
syntax enable
set number
set ts=4
set autoindent
set expandtab
set shiftwidth=4
set showmatch
set noswapfile
set nohlsearch
set incsearch
highlight EndOfBuffer ctermbg=none ctermfg=none
filetype indent plugin on

" see all recognized filetypes
noremap sft :setfiletype <C-d><cr>
nnoremap <C-h> :hi statusline none<cr>

" filetype switcher
nnoremap 'j :set filetype=javascript<cr>
nnoremap 'h :set filetype=html<cr>
nnoremap 'c :set filetype=css<cr>
nnoremap 't :set filetype=text<cr>

func Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

function! MyHighlights() abort
    hi StatusLine none
endfunction

" colorscheme
nnoremap c1 :colorscheme PaperColor<cr>
nnoremap c2 :colorscheme sonokai<cr>
nnoremap c3 :colorscheme oceanic_material<cr>
nnoremap c4 :colorscheme materialbox<cr>
nnoremap c5 :colorscheme two-firewatch<cr>
nnoremap c6 :colorscheme alduin<cr>
nnoremap c7 :colorscheme gruvbox<cr>
nnoremap <silent> <C-c> :colorscheme<cr> 

au BufEnter * call MyHighlights()
au ColorScheme * call MyHighlights()

" netrw settings----------------------------------------------------------
let g:netrw_liststyle= 3    " show the tree listing (0 - 3)
let g:netrw_winsize = 0     " set default window size to be equal
let g:netrw_preview = 1		" open splits to the right
let g:netrw_banner=0        " banner off; toggle on w/ I 
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
let ghregex='\(^\|\s\s\)\zs\.\S\+'    " hide dot files on startup
let g:netrw_list_hide = 'node_modules,package.json,package-lock.json,ghregex'

set nocompatible      "Limit search to your project -Fuzzy finder
set path+=**          "Search all subdirectories recursively
set wildmenu          "Shows multiple matches on one line

" by default, netrw leaves unmodified buffers open.  This autocommand
" deletes netrw's buffer once it's hidden (using ':q;, for example)
autocmd FileType netrw setl bufhidden=delete  " or use :qa!
" ---------------------------------------------------------^^-netrw-^^-----

" auto-close parentheses, et. al.----------------
inoremap { {}<left>
inoremap {{ {
inoremap {} {}
inoremap [ []<left>
inoremap [[ [
inoremap [] []
inoremap ( ()<left>
inoremap (( (
inoremap () ()
inoremap " ""<left>
inoremap "" ""
inoremap ' ''<left>
inoremap '' ''
inoremap ''' ''''''<left>
inoremap ` ``<left>
inoremap jk <esc>:w<cr>

"-------------------------------------------------

let mapleader=" "

"-------------------------------------------------
"set viewoptions-=options
set viewoptions=folds,cursor
set sessionoptions=folds
augroup remember_folds
  autocmd!
  au BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  au BufWinEnter ?* silent! loadview
augroup END

augroup hooks
    au!
    au bufwritepost .vimrc source ~/.vimrc
augroup END

"------------------------
" go to top of file
nnoremap t :0<cr>0
" go to EOF:     q
" go to line nr: <nr>q
nnoremap , G0
"------------------------
" moving
nnoremap <C-l> $
nnoremap <C-j> 10j
nnoremap <C-k> 10k

" indent line
nnoremap <leader>i :normal >>j<cr>
" create a new empty line above / below current one / both
nnoremap = O<esc>0Dj
nnoremap + o<esc>0Dk

" another way to autocomplete
inoremap xx <C-p>
" create a new empty space right of cursor
nnoremap sp a<space><esc>
" go 40 chars into line fr 0
nnoremap <leader>m 040l 
" 9 * page-down
nnoremap <C-n> 9<C-e>
" 9 * page-up
nnoremap <C-p> 9<C-y>
" clear line
nnoremap <leader>k 0Dj 

" yank line(s) into system clipboard
nnoremap <leader>' "+yy
vnoremap <leader>' "+y
" cut line(s) into system clipboard
vnoremap <leader>c "+d
" yank whole file into system clipboard
nnoremap <leader><leader>' gg0"+yG
" paste from clipboard
nnoremap <leader>p "+p
 
""   copy visual text into register u
""replace visual text with text from u
vnoremap <leader><leader>u "uy
vnoremap <leader><leader>p d"uP

"-- marks ----------------------------------------
" create mark Q, W, ..
nnoremap mq mQ
nnoremap mw mW
nnoremap me mE
nnoremap ma mA
nnoremap ms mS
nnoremap md mD
nnoremap mz mZ
nnoremap mx mX
nnoremap mc mC
" go to mark Q, W, ..
nnoremap `q `Q
nnoremap `w `W
nnoremap `e `E
nnoremap `a `A
nnoremap `s `S
nnoremap `d `D
nnoremap `z `Z
nnoremap `x `X
nnoremap `c `C
"-------------------------------------------------

"-------------------------------------------------
" yank word into register z
nnoremap <leader>y "zyiw
" yank line into register z
nnoremap <leader>\ "zyy
"
" yank visually selected text into register z
vnoremap <leader>y "zy
" replace visually selected text with text from register z
vnoremap <leader>v d"zP
"
" paste from register q
nnoremap <leader>v "zp
" paste from register z
nnoremap <leader>v "zp
" replace current Word with word from register z
nnoremap rv viW"zp
vnoremap rv "zpkdd
"-------------------------------------------------

" Start recording macro w/ qq or qw
" finish recording w/ q,
" execute macro w/ Q
nnoremap Q @q
"-------------------------------------------------

" open vimrc in a split; source the vimrc
" nnoremap <leader>ev :split ~/.vimrc<cr>
nnoremap <leader>ev :e ~/.vimrc<cr>
nnoremap gr :source ~/.vimrc<cr>:e<cr><C-o>
"nnoremap <leader>sv :source ~/.vimrc<cr>

" toggle highlight search with <space>h
nnoremap <silent> <leader>h :set hls!<cr>

" colorscheme
nnoremap <silent> <C-c> :colorscheme<cr> 

function! MyHighlights() abort
    hi StatusLine none
endfunction

au BufEnter * call MyHighlights()
au ColorScheme * call MyHighlights()

""colorscheme PaperColor
au FileType vim colorscheme sonokai
au FileType json colorscheme sonokai

" --buffer-cmds----------------------------------------------------------
" next/previous/toggle buffers
nnoremap gn :bn<cr>
nnoremap <C-s> :bn<cr>
nnoremap <C-a> :bp<cr>
nnoremap gp :bp<cr>
nnoremap gt :b#<cr>

"nnoremap gb :b 
nnoremap gb :ls<cr>:b<space> 
nnoremap ge :e 

" delete current buffer:
nnoremap gd :bd<cr>
" go to buffer 1 (usually netrw):
nnoremap g0 :b1<cr>
" list open buffers:
nnoremap gl :ls<cr>
" write and reload current buffer:
nnoremap gr :w<cr>:e<cr> 
" write  current buffer:
nnoremap gw :w<cr> 
" quit all w/write:
nnoremap gq :wqa<cr> 
" quit all w/out write:
nnoremap gh :wqa<cr> 
" shell command:
nnoremap gs :!
" shell command:
nnoremap <leader>w :!pwd<cr>

nnoremap g1 :b1<cr>
nnoremap g2 :b2<cr>
nnoremap g3 :b3<cr>
nnoremap g4 :b4<cr>
nnoremap g5 :b5<cr>
nnoremap g6 :b6<cr>
nnoremap g7 :b7<cr>
nnoremap g8 :b8<cr>
nnoremap g9 :b9<cr>

" ---------------------------------------------------^^-buffer cmds-^^---
" --ex cmds----------------------------------------------------------
" enter ex mode (yes, this is faster and easier by a goodly margin)
nnoremap <leader>e :  
" repeat last ex command:
nnoremap <leader>x @:
" toggle numbers:
nnoremap <leader>n :setl nu!<cr>
" toggle relative numbers:
nnoremap <leader>r :setl rnu!<cr>
" set filetype zsh
nnoremap <leader>fz :setl filetype=zsh<cr>

" ---------------------------------------------------^^-ex cmds-^^---

"move line up/down with -/_  
nnoremap - ddp
nnoremap _ ddkP
" move letter under cursor to right
nnoremap # xp
" duplicate current line below
nnoremap <leader>z yyp
" delete line; 
nnoremap \ dd
" delete word
nnoremap K diwx
" delete lines in visual mode
vnoremap \ d

onoremap p i(
onoremap sq i'
onoremap dq i"
onoremap c i{
onoremap b i[

" --html tags-----------------------------------------------------------
"surround with <></>
nnoremap <leader>t diwi<></><esc>F<;pf/pF>
" --ejs tags-----------------------------------------------------------
"insert ejs tag
nnoremap <leader>ej i<% %><esc>F<la

" --quotes--------------------------------------------------------------
"surround with ' ', " ", ` ` , parentheses from normal, visual modes
nnoremap <leader>sq viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>dq viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>pr viw<esc>a)<esc>bi(<esc>lel

vnoremap <leader>sq <esc>`<i'<esc>`>ea'<esc>
vnoremap <leader>dq <esc>`<i"<esc>`>ea"<esc>
vnoremap <leader>bt <esc>`<i`<esc>`>ea`<esc>
vnoremap <leader>pr di()<esc>hp

" ---------------------------------------------------^^-quotes-^^------

"uppercase current word in insert or normal mode
inoremap <c-\> <esc>viwUea
nnoremap <c-\> viwUea<esc>
""vnoremap <c-u> <esc>viwUea

" general abreviations
inoreabb w/ with
inoreabb otw otherwise
inoreabb nl "\n"
inoreabb dnl "\n\n"
inoreabb tb "\t"
inoreabb nlt "\n\t"
inoreabb rqd required:
inoreabb lh http://localhost:8080<esc>

"-------------------------------------------------
" %% will automatically expand to the path of the active buffer
"   on the command-line prompt, :e %%, e.g.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
 
augroup filetype_text
    autocmd!
    au FileType text colorscheme oceanic_material
    au FileType text hi statusline none
augroup END


"zsh----------------------------------------------------------
nnoremap <leader>shb :-1read ~/.vim/.zsh-starter<cr>

au BufEnter,BufNewFile,BufRead *.zshrc setl filetype=zsh
augroup filetype_zsh
    autocmd!
    au FileType zsh colorscheme oceanic_material
    au FileType zsh hi StatusLine ctermbg=bg ctermfg=bg
    au FileType zsh nnoremap <buffer> <leader>c :norm 0i#<cr>j
    au FileType zsh nnoremap <buffer> <leader>u :norm 0x<cr>j
    au FileType zsh nnoremap <buffer> <leader>; A;<esc>
    au FileType zsh inoreabb <buffer> sel <esc>:-1read ~/.vim/.select.sh<cr>
    au FileType zsh inoreabb <buffer> pe ${}<esc>F$la
    au FileType zsh inoreabb <buffer> ae $(())<esc>F$lla
    au FileType zsh inoreabb <buffer> cs $()<esc>F$la
    au FileType zsh inoreabb <buffer> if if [ ]; then<cr>fi<esc>kw
    au FileType zsh inoreabb <buffer> wh while [ ]; do<cr>done<esc>k0wa
    au FileType zsh inoreabb <buffer> rwh while read line; do<cr>done < "$1"<esc>k0wh
    au FileType zsh inoreabb <buffer> fl for ((i = 0; i < 10; ++i)); do<cr>done<esc>k0h
    au FileType zsh inoreabb <buffer> for for x in $xs; do<cr>done<esc>k0fxh
    au FileType zsh inoreabb <buffer> case case $opt in<cr>esac<esc>k02e
    au FileType zsh inoreabb <buffer> oa $OPTARG
    au FileType zsh inoreabb <buffer> ec echo
augroup END

"Vim----------------------------------------------------------
augroup filetype_vim
    autocmd!
    au FileType vim colorscheme PaperColor
""    au FileType vim hi statusline none
    au * vim hi statusline none
    au FileType vim nnoremap <buffer> <leader>c :normal 0i"<cr>j
    au FileType vim nnoremap <buffer> <leader>u :normal 0xx<cr>j
augroup END

"python----------------------------------------------------------
augroup filetype_python
    autocmd!
    au FileType python colorscheme oceanic_material
"     au FileType python nnoremap <buffer> <leader>c I#<esc>
    au FileType python nnoremap <buffer> <leader>c :norm 0i#<cr>j
    au FileType python nnoremap <buffer> <leader>u :norm 0x<cr>j
    au FileType python inoreabb init def __init__(self):<cr>pass<esc>
    au FileType python inoreabb str def __str__(self):<cr>pass<esc>
    au FileType python inoreabb repr def __repr__(self):<cr>pass<esc>
    au FileType python inoreabb rtn return

    "---django-------------------------------------------------------
    au FileType python inoreabb dj django<esc>A
    au FileType python inoreabb diu from django.contrib.auth.models import User<esc>
    au FileType python inoreabb dir from django.urls import reverse<esc>
    "---rest_framework-----------------------------------------------
    au FileType python inoreabb rfser from rest_framework import serializers<esc>
    au FileType python inoreabb rfstatus from rest_framework import status<esc>
    au FileType python inoreabb rft from rest_framework.test import APITestCase<esc>
augroup END
"--------------------------------------------------^^-python ^^---

" cpp
au BufEnter,BufNewFile,BufRead *.cpp,*.h,*.c setl filetype=cpp
augroup filetype_cpp
    autocmd!

"   colorscheme & syntax highlighting tweaks
    au FileType cpp colorscheme PaperColor
    au FileType cpp hi folded ctermbg=234
    au FileType cpp hi folded ctermfg=058
    au FileType cpp hi statusline none


    au FileType cpp syn match dFunction "\<\k\+\ze("
    au FileType cpp syn match dFunction "\<\k\+\ze<"
    au FileType cpp hi link dFunction Function

    au FileType cpp hi StorageClass ctermfg=160
    au FileType cpp hi Statement ctermfg=172
    au FileType cpp hi Function ctermfg=179
    au FileType cpp hi String ctermfg=132
    au FileType cpp hi Include ctermfg=62

    au FileType cpp syntax keyword Type string stringstream string_view tuple
    au FileType cpp syntax keyword Include /<string>/ 
    au FileType cpp syntax keyword Label typename boolalpha namespace
    au FileType cpp syntax keyword Keyword class template
    au FileType cpp syntax keyword StorageClass vector array tuple bitset
    au FileType cpp syntax keyword Statement constexpr constinit


    au FileType cpp nnoremap <buffer> <leader>c :norm 0i//<cr>j
    au FileType cpp nnoremap <buffer> <leader>u :norm 0xx<cr>j
    au FileType cpp nnoremap <buffer> <leader>bc O<esc>i/*<cr>*/<esc>hd0
    au FileType cpp nnoremap <buffer> <leader>[ A {<cr>}<esc>
    au FileType cpp nnoremap <buffer> <leader>] o{<cr>}<esc>k0
    au FileType cpp nnoremap <buffer> <leader>; A;<esc>:w<cr>
    au FileType cpp nnoremap <buffer> r; Da;<esc>0
"   insert std::
    au FileType cpp nnoremap <buffer> <leader>s istd::<esc>
"   remove std::
    au FileType cpp nnoremap <buffer> <leader>rms :%s/std:://g<cr>
"   virtual to override
    au FileType cpp nnoremap <buffer> <leader>vto 0wdwf=Di override {}<esc>0
    au FileType cpp nnoremap <buffer> m. a-><esc>a
    au FileType cpp nnoremap <buffer> <leader><leader>y :-1read ~/.vim/.main.cpp<cr> 

    au FileType cpp inoreabb <buffer> perf <esc>:-1read ~/.vim/.performance.cpp<cr>
    au FileType cpp inoreabb <buffer> cls <esc>:-1read ~/.vim/.class.cpp<cr>
    au FileType cpp inoreabb <buffer> stk <esc>:-1read ~/.vim/.struct.cpp<cr>j?name<cr>;h
    au FileType cpp inoreabb <buffer> doth <esc>:-1read ~/.vim/.h_starter.cpp<cr>
    au FileType cpp inoreabb <buffer> prarr <esc>:-1read ~/.vim/.print_array.cpp<cr>
    au FileType cpp inoreabb <buffer> prv <esc>:-1read ~/.vim/.print_vector.cpp<cr>
    au FileType cpp inoreabb <buffer> sep <esc>:-1read ~/.vim/.separator.cpp<cr>

    au FileType cpp inoreabb <buffer> ncl #include <><esc>hh
    au FileType cpp inoreabb <buffer> nclrng #include <ranges><esc>
    au FileType cpp inoreabb <buffer> nclrx #include <regex><esc>
    au FileType cpp inoreabb <buffer> nclfmt #include <format><esc>
    au FileType cpp inoreabb <buffer> nclalg #include <algorithm><esc>
    au FileType cpp inoreabb <buffer> nclnm #include <numeric><esc>
    au FileType cpp inoreabb <buffer> nclrnd #include <random><esc>
    au FileType cpp inoreabb <buffer> nclcr #include <coroutine><esc>
    au FileType cpp inoreabb <buffer> nclit #include <iterator><esc>
    au FileType cpp inoreabb <buffer> ncls #include <string><esc>
    au FileType cpp inoreabb <buffer> nclss #include <sstream><esc>
    au FileType cpp inoreabb <buffer> nclf #include <functional><esc>
    au FileType cpp inoreabb <buffer> nclio #include <iostream><esc>
    au FileType cpp inoreabb <buffer> nclsv #include <string_view><esc>
    au FileType cpp inoreabb <buffer> nclcon #include <concepts><esc>
    au FileType cpp inoreabb <buffer> nclchr #include <chrono><esc>
    au FileType cpp inoreabb <buffer> nclthr #include <thread><esc>
    au FileType cpp inoreabb <buffer> nclmem #include <memory><esc>
    au FileType cpp inoreabb <buffer> nclios #include <ios><esc>
    au FileType cpp inoreabb <buffer> nclsio #include <cstdio><esc>
    au FileType cpp inoreabb <buffer> ncldef #include <cstddef><esc>
    au FileType cpp inoreabb <buffer> nclsl #include <cstdlib><esc>
    au FileType cpp inoreabb <buffer> nclfs #include <fstream><esc>
    au FileType cpp inoreabb <buffer> ncliom #include <iomanip><esc>
    au FileType cpp inoreabb <buffer> nclcs #include <cstring><esc>
    au FileType cpp inoreabb <buffer> nclsig #include <csignal><esc>
    au FileType cpp inoreabb <buffer> nclt #include <ctime><esc>
    au FileType cpp inoreabb <buffer> nclct #include <cctype><esc>
    au FileType cpp inoreabb <buffer> nclm #include <cmath><esc>
    au FileType cpp inoreabb <buffer> ncll #include <limits><esc>
    au FileType cpp inoreabb <buffer> nclmem #include <memory><esc>
    au FileType cpp inoreabb <buffer> ncln #include <numbers><esc>
    au FileType cpp inoreabb <buffer> ncla #include <array><esc>
    au FileType cpp inoreabb <buffer> nclv #include <vector><esc>
    au FileType cpp inoreabb <buffer> ncltp #include <tuple><esc>
    au FileType cpp inoreabb <buffer> ncldq #include <deque><esc>
    au FileType cpp inoreabb <buffer> ncllst #include <list><esc>
    au FileType cpp inoreabb <buffer> nclflst #include <forward_list><esc>
    au FileType cpp inoreabb <buffer> nclu #include <utility><esc>
    au FileType cpp inoreabb <buffer> nclmap #include <map><esc>
    au FileType cpp inoreabb <buffer> nclset #include <set><esc>
    au FileType cpp inoreabb <buffer> ncluset #include <unordered_set><esc>
    au FileType cpp inoreabb <buffer> nclq #include <queue><esc>
    au FileType cpp inoreabb <buffer> nclstk #include <stack><esc>
    au FileType cpp inoreabb <buffer> nclx #include <exception><esc>
    au FileType cpp inoreabb <buffer> nclsx #include <stdexcept><esc>
    au FileType cpp inoreabb <buffer> nclass #include <cassert><esc>
    au FileType cpp inoreabb <buffer> nclbs #include <bitset><esc>
    au FileType cpp inoreabb <buffer> ncltt #include <type_traits><esc>
    au FileType cpp inoreabb <buffer> nclil #include <initializer_list><esc>
    au FileType cpp inoreabb <buffer> nclh #include ".h"<esc>F.h

"   namespaces
    au FileType cpp inoreabb <buffer> usreg <esc>:-1read ~/.vim/.regex.cpp<cr>
    au FileType cpp inoreabb <buffer> us using std::<c-r>=Eatchar('\s')<cr>
    au FileType cpp inoreabb <buffer> usc using std::cout;<esc>
    au FileType cpp inoreabb <buffer> usv using std::vector;<esc>
    au FileType cpp inoreabb <buffer> usw using std::setw;<esc>
    au FileType cpp inoreabb <buffer> uss using std::string;<esc>
    au FileType cpp inoreabb <buffer> usfw using std::forward;<esc>
    au FileType cpp inoreabb <buffer> usacc using std::accumulate;<esc>
    au FileType cpp inoreabb <buffer> urv using std::ranges::views::
    au FileType cpp inoreabb <buffer> urvi using std::ranges::views::iota;<esc>
    au FileType cpp inoreabb <buffer> urvf using std::ranges::views::filter;<esc>
    au FileType cpp inoreabb <buffer> urvt using std::ranges::views::transform;<esc>
    au FileType cpp inoreabb <buffer> urvr using std::ranges::views::reverse;<esc>
    au FileType cpp inoreabb <buffer> usrnd <esc>:-1read ~/.vim/.random.cpp<cr>;

    au FileType cpp inoreabb <buffer> nsp namespace
    au FileType cpp inoreabb <buffer> uns using namespace std::
    au FileType cpp inoreabb <buffer> unl using namespace std::literals;<esc>
    au FileType cpp inoreabb <buffer> unch using namespace std::chrono;<esc>
    au FileType cpp inoreabb <buffer> unchl using namespace std::chrono_literals;<esc>
    au FileType cpp inoreabb <buffer> ppp public:<cr>private:<cr>protected:<esc>

"   io
    au FileType cpp inoreabb <buffer> out cout <<
    au FileType cpp inoreabb <buffer> in cin >>
    au FileType cpp inoreabb <buffer> gl getline(cin, )<esc>F,l
    au FileType cpp inoreabb <buffer> onl cout << "\n";<esc>Fnh
    au FileType cpp inoreabb <buffer> ot cout << "\t";<esc>
    au FileType cpp inoreabb <buffer> sw setw(5)<esc>F5h
    au FileType cpp inoreabb <buffer> osw cout << setw(5) <<
    au FileType cpp inoreabb <buffer> odnl cout << "\n\n";<esc>Fnh


"   types
    au FileType cpp inoreabb <buffer> tmt time_t
    au FileType cpp inoreabb <buffer> tp tuple<><esc>Fel
    au FileType cpp inoreabb <buffer> bt bitset<8>()<esc>F8h
    au FileType cpp inoreabb <buffer> uc unsigned char
    au FileType cpp inoreabb <buffer> ul unsigned long
    au FileType cpp inoreabb <buffer> str string
    au FileType cpp inoreabb <buffer> sv string_view
    au FileType cpp inoreabb <buffer> bs basic_string
    au FileType cpp inoreabb <buffer> bss basic_stringstream
    au FileType cpp inoreabb <buffer> ss stringstream 
    au FileType cpp inoreabb <buffer> sl string_literals
    au FileType cpp inoreabb <buffer> dbl double
    au FileType cpp inoreabb <buffer> ld long double
    au FileType cpp inoreabb <buffer> flt float
    au FileType cpp inoreabb <buffer> ui unsigned int
    au FileType cpp inoreabb <buffer> wc wchar_t
    au FileType cpp inoreabb <buffer> vint vector<int><esc>Frl
    au FileType cpp inoreabb <buffer> vd vector<double><esc>Frl
    au FileType cpp inoreabb <buffer> vs vector<string><esc>Fsh
    au FileType cpp inoreabb <buffer> ba boolalpha
    au FileType cpp inoreabb <buffer> alc allocator
    au FileType cpp inoreabb <buffer> ec enum class Name <cr>{<cr>};<esc>kkfNh


"   functions
    au FileType cpp inoreabb <buffer> pfcn __PRETTY_FUNCTION__
    au FileType cpp inoreabb <buffer> ts to_string()<esc>Fgl
    au FileType cpp inoreabb <buffer> so sizeof()<esc>Ffl
    au FileType cpp inoreabb <buffer> prnt auto print = [] (const auto& x) { cout << x; };
    au FileType cpp inoreabb <buffer> tbb auto tab = [] (int n = 1) { for (int i{ 0 }; i < n; ++i) cout << "\t"; };<esc>
    au FileType cpp inoreabb <buffer> nwl auto newline = [] (int n = 1) { for (int i{ 0 }; i < n; ++i) cout << "\n"; };<esc>

"   random
    au FileType cpp inoreabb <buffer> rndint <esc>:-1read ~/.vim/.rand_int.cpp<cr>
    au FileType cpp inoreabb <buffer> sr srand(time(nullptr));<esc>0h

"   fstream, sstream
    au FileType cpp inoreabb <buffer> oss ostringstream
    au FileType cpp inoreabb <buffer> fs fstream
    au FileType cpp inoreabb <buffer> ofs ofstream
    au FileType cpp inoreabb <buffer> ifs ifstream
    au FileType cpp inoreabb <buffer> usfs using std::fstream;<esc>Ffh
    au FileType cpp inoreabb <buffer> usios using std::ios;<esc>
    au FileType cpp inoreabb <buffer> iosi ios::in
    au FileType cpp inoreabb <buffer> ioso ios::out
    au FileType cpp inoreabb <buffer> iosa ios::app
    au FileType cpp inoreabb <buffer> iost ios::trunc
    au FileType cpp inoreabb <buffer> iosb ios::beg
    au FileType cpp inoreabb <buffer> iosc ios::cur
    au FileType cpp inoreabb <buffer> iose ios::end
    au FileType cpp inoreabb <buffer> iosbin ios::binary<esc>


"   templates
    au FileType cpp inoreabb <buffer> tn typename
    au FileType cpp inoreabb <buffer> tt <typename T><esc>FTh
    au FileType cpp inoreabb <buffer> ttt template <typename T><esc>FTh
    au FileType cpp inoreabb <buffer> tft template <typename F><esc>FTh
    au FileType cpp inoreabb <buffer> tct template <class T><esc>FTh
    au FileType cpp inoreabb <buffer> ttu template <typename T, typename U><esc>FUh

"   iterators
    au FileType cpp inoreabb <buffer> itr iterator
    au FileType cpp inoreabb <buffer> ins inserter
    au FileType cpp inoreabb <buffer> adv advance
    au FileType cpp inoreabb <buffer> bi back_inserter
    au FileType cpp inoreabb <buffer> bii back_insert_iterator
    au FileType cpp inoreabb <buffer> bte v.begin(), v.end()<esc>Fbhhh
    au FileType cpp inoreabb <buffer> cbte v.cbegin(), v.cend()<esc>Fv;h

    au FileType cpp inoreabb <buffer> rtn return
    au FileType cpp inoreabb <buffer> dt decltype

"   loops
    au FileType cpp inoreabb <buffer> fl for (size_t i{ 0 }; i < x; ++i)<esc>0fx<left>
    au FileType cpp inoreabb <buffer> flj for (int j = 0; j < x; j++) {<cr>}<esc>k0fx<left>
    au FileType cpp inoreabb <buffer> wh while () {<cr>}<esc>k02w
    au FileType cpp inoreabb <buffer> dw do <cr>{<cr>} while (true);<esc>O//<esc>0wh

    au FileType cpp inoreabb <buffer> pra #pragma once<esc>
    au FileType cpp inoreabb <buffer> ppd #ifndef<cr>#define<cr><cr>#endif<esc>
    au FileType cpp inoreabb <buffer> pb push_back();<esc>Fkl
    au FileType cpp inoreabb <buffer> eb emplace_back();<esc>Fkl
    au FileType cpp inoreabb <buffer> ch <<
    au FileType cpp inoreabb <buffer> hc >>
    au FileType cpp inoreabb <buffer> che << endl;<esc>
    au FileType cpp inoreabb <buffer> th this-><esc>F-
    au FileType cpp inoreabb <buffer> ew err.what()<esc>
    au FileType cpp inoreabb <buffer> rerr runtime_error

"   pointers, make
    au FileType cpp inoreabb <buffer> np nullptr
    au FileType cpp inoreabb <buffer> del delete
    au FileType cpp inoreabb <buffer> qp unique_ptr<double><esc>Fdh
    au FileType cpp inoreabb <buffer> shp shared_ptr<int><esc>Fih
    au FileType cpp inoreabb <buffer> mq make_unique<double>();<esc>Fdh
    au FileType cpp inoreabb <buffer> mksh make_shared<double>();<esc>Fdh
    au FileType cpp inoreabb <buffer> mktp make_tuple();<esc>Fel
    au FileType cpp inoreabb <buffer> mkp make_pair();<esc>Frl

"   casts or cast-like functions
    au FileType cpp inoreabb <buffer> sc static_cast<>()<esc>Ftl
    au FileType cpp inoreabb <buffer> dc dynamic_cast<>()<esc>Ftl
    au FileType cpp inoreabb <buffer> cc const_cast<>()<esc>Ftl
    au FileType cpp inoreabb <buffer> rc reinterpret_cast<>()<esc>Ftl
    au FileType cpp inoreabb <buffer> fw forward<T>()<esc>FTh

    au FileType cpp inoreabb <buffer> pf printf("")<esc>Ffll
    au FileType cpp inoreabb <buffer> ne !=
    au FileType cpp inoreabb <buffer> st size_t
    au FileType cpp inoreabb <buffer> pd ptrdiff_t
    au FileType cpp inoreabb <buffer> lam [](){<cr>}<esc>k0f]
    au FileType cpp inoreabb <buffer> acc accumulate()<esc>Fel
    au FileType cpp inoreabb <buffer> es EXIT_SUCCESS;<esc>
    au FileType cpp inoreabb <buffer> ef EXIT_FAILURE;<esc>

"   type_traits,  concepts
    au FileType cpp inoreabb <buffer> tti is_integral_v<T><esc>FTh
    au FileType cpp inoreabb <buffer> ttfp is_floating_point_v<T>
    au FileType cpp inoreabb <buffer> ttf is_function_v<T>
    au FileType cpp inoreabb <buffer> ttcls is_class_v<T>
    au FileType cpp inoreabb <buffer> ttp is_pointer_v<T>
    au FileType cpp inoreabb <buffer> tta is_array_v<T>
    au FileType cpp inoreabb <buffer> ttv is_void_v<T>
    au FileType cpp inoreabb <buffer> ttc is_default_constructible_v<T>
    au FileType cpp inoreabb <buffer> ttu underlying_type_t<T><esc>FTh
    au FileType cpp inoreabb <buffer> eit enable_if_t<><esc>Ftll
    au FileType cpp inoreabb <buffer> rq requires

    au FileType cpp inoreabb <buffer> thp this->
    au FileType cpp inoreabb <buffer> il initializer_list<double><esc>Fdh
    au FileType cpp inoreabb <buffer> op operator
    au FileType cpp inoreabb <buffer> df default
    au FileType cpp inoreabb <buffer> po partial_ordering
    au FileType cpp inoreabb <buffer> stro string_ordering
    au FileType cpp inoreabb <buffer> wo weak_ordering
    au FileType cpp inoreabb <buffer> sa static_assert();<esc>Ftl
    au FileType cpp inoreabb <buffer> fcn function
    au FileType cpp inoreabb <buffer> prq priority_queue<int><esc>Fih
    au FileType cpp inoreabb <buffer> fe for_each(begin(), end());<esc>Fill
    au FileType cpp inoreabb <buffer> lf [] () { }<esc>6h
    au FileType cpp inoreabb <buffer> nx noexcept
    au FileType cpp inoreabb <buffer> if if ()<esc>hh
    au FileType cpp inoreabb <buffer> ctor constructor
    au FileType cpp inoreabb <buffer> dtor deconstructor

"   specifiers
    au FileType cpp inoreabb <buffer> co const
    au FileType cpp inoreabb <buffer> ce constexpr
    au FileType cpp inoreabb <buffer> ice if constexpr
    au FileType cpp inoreabb <buffer> ci constinit
    au FileType cpp inoreabb <buffer> cev consteval
    au FileType cpp inoreabb <buffer> vr virtual
    au FileType cpp inoreabb <buffer> ov override<esc>Foeh
    au FileType cpp inoreabb <buffer> xp explicit

"   chrono
    au FileType cpp inoreabb <buffer> hrc high_resolution_clock::now()<esc>
    au FileType cpp inoreabb <buffer> drc duration_cast<microseconds>()<esc>Fmh

 
"   coroutines    
    au FileType cpp inoreabb <buffer> gn generator<int><esc>Fih
    au FileType cpp inoreabb <buffer> coy co_yield
    au FileType cpp inoreabb <buffer> cor co_return
    au FileType cpp inoreabb <buffer> coa co_await

"   Qt
    au FileType cpp inoreabb <buffer> nclqdb #include <QDebug><esc>
    au FileType cpp inoreabb <buffer> nclqts #include <QTextStream><esc>
    au FileType cpp inoreabb <buffer> nclqv #include <QVariant><esc>
    au FileType cpp inoreabb <buffer> nclqt #include <QTimer><esc>

    au FileType cpp inoreabb <buffer> qs QString
    au FileType cpp inoreabb <buffer> qo QObject
    au FileType cpp inoreabb <buffer> qts QTextStream

    au FileType cpp inoreabb <buffer> qfi Q_FUNC_INFO
    au FileType cpp inoreabb <buffer> qi qInfo() <<
    au FileType cpp inoreabb <buffer> qdb qDebug() <<
    au FileType cpp inoreabb <buffer> qson setObjectName("");<esc>3h
    au FileType cpp inoreabb <buffer> cn connect()<esc>hh


augroup END

"javaScript-------------------------------------------------------
au BufEnter,BufNewFile,BufRead *.ts setl filetype=javascript
au BufEnter,BufNewFile,BufRead *.vue setl filetype=javascript
augroup filetype_javascript
    autocmd!
    let maplocalleader=","
    au FileType javascript colorscheme PaperColor
    au FileType javascript hi statusline none
    au FileType javascript setlocal shiftwidth=2 tabstop=2
    au FileType javascript nnoremap <buffer> <leader>c :norm 0i//<cr>j
    au FileType javascript nnoremap <buffer> <leader>u :norm 0xx<cr>j
    au FileType javascript nnoremap <buffer> <leader>bc 0i/* */<esc>0f*;
    au FileType javascript nnoremap <buffer> <leader>; A;<esc>:w<cr>
    au FileType javascript nnoremap <buffer> <leader>b viw<esc>a!<esc>
    au FileType javascript nnoremap <buffer> <leader>tc A<cr>  .then()<cr>
                                    \  .catch();<esc>k0fnl
    au FileType javascript nnoremap <buffer> <leader>dt 0A<cr>.then()<esc>V>l
    au FileType javascript nnoremap <buffer> <leader>dc 0A<cr>.catch()<esc>V>l
    au FileType javascript nnoremap <buffer> <leader>tt A<cr>.then()<esc>0fnl
    au FileType javascript nnoremap <buffer> <leader>[ A {<cr>}<esc>O//<esc>j0A<esc>
    au FileType javascript nnoremap <buffer> <leader>et a<><cr></><esc>
    au FileType javascript nnoremap <buffer> <leader>sct a< /><esc><left><left>i
    au FileType javascript nnoremap <buffer> <leader>h1 a<h1></h1><esc>F1;lli
    au FileType javascript nnoremap <buffer> <leader>l iconsole.log();<esc>hi
    au FileType javascript nnoremap <buffer> <leader>ln 0i//-<esc>yl70pa//<esc>
    au FileType javascript nnoremap <buffer> <leader>q 0f.i<cr><esc>
    au FileType javascript nnoremap <buffer> <leader>api :-1read ~/.vim/.api-app.js<cr>
    au FileType javascript nnoremap <buffer> <leader>app :-1read ~/.vim/.app.js<cr>
    au FileType javascript nnoremap <buffer> <leader>gqlq :-1read ~/.vim/.gqlQuery.js<cr>

    " vanilla
    au FileType javascript inoreabb <buffer> ok Object.keys()<esc>Fsl
    au FileType javascript inoreabb <buffer> len length<esc>Ft
    au FileType javascript inoreabb <buffer> th this.<esc>Fsl
    au FileType javascript inoreabb <buffer> wh while()<esc>Fel
    au FileType javascript inoreabb <buffer> inf Infinity<esc>
    au FileType javascript inoreabb <buffer> fe forEach()<esc>Fhl
    au FileType javascript inoreabb <buffer> ls localStorage.setItem('')<esc>Fml
    au FileType javascript inoreabb <buffer> t true
    au FileType javascript inoreabb <buffer> f false
    au FileType javascript inoreabb <buffer> cl console.log()<esc>Fgl
    au FileType javascript inoreabb <buffer> evt event.target
    au FileType javascript inoreabb <buffer> cla classList.add('')<esc>Fdll
    au FileType javascript inoreabb <buffer> clr classList.remove('')<esc>Fell
    au FileType javascript inoreabb <buffer> clt classList.toggle('')<esc>Fell
    au FileType javascript inoreabb <buffer> clc classList.contains('')<esc>Fsll
    au FileType javascript inoreabb <buffer> sa setAttribute('', '')<esc>Fell
    au FileType javascript inoreabb <buffer> ra removeAttribute('', '')<esc>Fell
    au FileType javascript inoreabb <buffer> rc removeChild()<esc>Fdl
    au FileType javascript inoreabb <buffer> fc firstChild<esc>h
    au FileType javascript inoreabb <buffer> fec firstElementChild<esc>h
    au FileType javascript inoreabb <buffer> rm remove()<esc>Fel
    au FileType javascript inoreabb <buffer> ht offsetHeight
    au FileType javascript inoreabb <buffer> wd offsetWidth
    au FileType javascript inoreabb <buffer> iae insertAdjacentElement('afterend', el);<esc>Feh
    au FileType javascript inoreabb <buffer> gb getBoundingClientRect();

    au FileType javascript inoreabb <buffer> odp Object.defineProperty()
    au FileType javascript inoreabb <buffer> ed export default {};<esc>Ftl
    au FileType javascript inoreabb <buffer> exp exports.<esc>Fs
    au FileType javascript inoreabb <buffer> etv event.target.value;<esc>F;h
    au FileType javascript inoreabb <buffer> fcn function
    au FileType javascript inoreabb <buffer> fcns functions
    au FileType javascript inoreabb <buffer> rtn return
    au FileType javascript inoreabb <buffer> ar =>
    au FileType javascript inoreabb <buffer> if if ()<esc>Fflla
    au FileType javascript inoreabb <buffer> rt return
    au FileType javascript inoreabb <buffer> und undefined
    au FileType javascript inoreabb <buffer> m. Math.
    au FileType javascript inoreabb <buffer> ctor constructor()<space>{<esc>a<cr>}<esc>O
    
    au FileType javascript inoreabb <buffer> trc try {<cr>}
                                             \ catch {<cr>}<esc>O//<esc>kko//<esc>hh
    au FileType javascript inoreabb <buffer> us user.save();<esc>
    au FileType javascript inoreabb <buffer> sto Schema.Types.ObjectId<esc>
    au FileType javascript inoreabb <buffer> ene const error = new Error('');<esc>Frll
    au FileType javascript inoreabb <buffer> tne throw new Error('');<esc>Frll
    au FileType javascript inoreabb <buffer> thr throw error;<esc>
    au FileType javascript inoreabb <buffer> stc error.statusCode = 403;<esc>
    au FileType javascript inoreabb <buffer> rq require('');<esc>Fell
    au FileType javascript inoreabb <buffer> im import from '';<esc>Fta
    au FileType javascript inoreabb <buffer> ts toString()<esc>
    au FileType javascript inoreabb <buffer> tis toISOString()<esc>
    au FileType javascript inoreabb <buffer> co const
    au FileType javascript inoreabb <buffer> tv ${ }<esc>F$la
    au FileType javascript inoreabb <buffer> aw await
    au FileType javascript inoreabb <buffer> sv save();<esc>:w<cr>
    au FileType javascript inoreabb <buffer> me module.exports<esc>
    au FileType javascript inoreabb <buffer> ex export
    au FileType javascript inoreabb <buffer> fbi findById()<esc>Fdl
    au FileType javascript inoreabb <buffer> fi findIndex()<esc>Fxl
    au FileType javascript inoreabb <buffer> arf const x = () => {<cr>};<esc>k0fx<left>
    au FileType javascript inoreabb <buffer> acb () =>
    au FileType javascript inoreabb <buffer> pn parentNode
    au FileType javascript inoreabb <buffer> qs querySelector()<esc>Frl
    au FileType javascript inoreabb <buffer> rj res.json({<cr>});<esc>O//<esc>0f/h
    au FileType javascript inoreabb <buffer> fl for (i = 0; i < x; i++) {<cr>}<esc>k0fx<left>

    au FileType javascript inoreabb <buffer> ofe Object.fromEntries()<esc>Fsl
    au FileType javascript inoreabb <buffer> ov Object.values()<esc>Fsl
    au FileType javascript inoreabb <buffer> af Array.from()<esc>Fml
    au FileType javascript inoreabb <buffer> jst JSON.stringify()<esc>Fyl
    au FileType javascript inoreabb <buffer> jsp JSON.parse()<esc>Fel
    au FileType javascript inoreabb <buffer> tuc toUpperCase()<esc>
    au FileType javascript inoreabb <buffer> rsj res.status(200).json({<cr>});<esc>
                                             \k0f2l
    au FileType javascript inoreabb <buffer> emw app.use((error, req, res, next)
                \ => {<cr>});<esc>
                \Oconsole.log(error);<cr>const status = error.statusCode;<cr>
                \const message = error.message;<cr>res.status(status).json({ message });

    " firebase
    au FileType javascript inoreabb <buffer> fi this.$fire.<esc>h
    au FileType javascript inoreabb <buffer> fim this.$fireModule.<esc>h
    au FileType javascript inoreabb <buffer> dbc db.collection('')<esc>Fnll

    au FileType javascript inoreabb <buffer> fb firebase
    au FileType javascript inoreabb <buffer> fs firestore()
    au FileType javascript inoreabb <buffer> ffc firebase.firestore().collection('')<esc>Fnll
    au FileType javascript inoreabb <buffer> ffd functions.firestore.document('')<esc>Ftll
    au FileType javascript inoreabb <buffer> ff firebase.functions()
    au FileType javascript inoreabb <buffer> ffh firebase.functions().httpsCallable('')<esc>Fell
    au FileType javascript inoreabb <buffer> coll collection
    au FileType javascript inoreabb <buffer> afc admin.firestore().collection('')<esc>Fnll
    au FileType javascript inoreabb <buffer> ons onSnapshot(snapshot => {<cr>})<esc>
    au FileType javascript inoreabb <buffer> fhoc functions.https.onCall((data, context) => 
                                                \{<cr>});<esc>F;
    au FileType javascript inoreabb <buffer> fhor functions.https.onRequest((req, res) => 
                                                \{<cr>});<esc>F;

    " node express
    au FileType javascript inoreabb <buffer> rrn (req, res, next) => {<cr>}<esc>O//<esc>
    au FileType javascript inoreabb <buffer> rne return next(new Error(''));<esc>Frll
    au FileType javascript inoreabb <buffer> nxt next();<esc>
    au FileType javascript inoreabb <buffer> rr res.render('/');<esc>F/
    au FileType javascript inoreabb <buffer> itf interface
    au FileType javascript inoreabb <buffer> xp export
    au FileType javascript inoreabb <buffer> df default
    au FileType javascript inoreabb <buffer> ctaj 'Content-Type': 'application/json'<esc>
    au FileType javascript inoreabb <buffer> rrd res.redirect('/')<esc>F/
    au FileType javascript inoreabb <buffer> au app.use();<esc>Fela
    au FileType javascript inoreabb <buffer> rqp const path = require('path');<esc>
    au FileType javascript inoreabb <buffer> rqf const fs = require('fs');<esc>
    au FileType javascript inoreabb <buffer> rb req.body

    " DOM
    au FileType javascript inoreabb <buffer> pd preventDefault();<esc>
    au FileType javascript inoreabb <buffer> dcm document
    au FileType javascript inoreabb <buffer> ce document.createElement();<left><left>
    au FileType javascript inoreabb <buffer> ctn document.createTextNode('');<esc>Fell
    au FileType javascript inoreabb <buffer> cf let fragment = document.createDocumentFragment();<esc>0ff
    au FileType javascript inoreabb <buffer> gebi document.getElementById('');<esc>Fdll
    au FileType javascript inoreabb <buffer> qs document.querySelector('');<esc>Frll
    au FileType javascript inoreabb <buffer> qsa document.querySelectorAll('');<esc>Flll
    au FileType javascript inoreabb <buffer> nes nextElementSibling
    au FileType javascript inoreabb <buffer> ac appendChild();<esc>Fdla
    au FileType javascript inoreabb <buffer> ael addEventListener('');<esc>Frlla

    au FileType javascript inoreabb <buffer> imr import React from 'react';<esc>
    au FileType javascript inoreabb <buffer> xd export default;<left>
    au FileType javascript inoreabb <buffer> swp const swap = (arr, i, j) =>
                            \ [arr[i], arr[j]] = [arr[j], arr[i]];<esc>

    " read files
    au FileType javascript inoreabb <buffer> rng <esc>:-1read ~/.vim/.range.js<cr>
    au FileType javascript inoreabb <buffer> rndi <esc>:-1read ~/.vim/.randInt.js<cr>
    au FileType javascript inoreabb <buffer> shffl <esc>:-1read ~/.vim/.shuffle.js<cr>
    au FileType javascript inoreabb <buffer> vstore <esc>:-1read ~/.vim/.vstore.js<cr>
    au FileType javascript inoreabb <buffer> vstate <esc>:-1read ~/.vim/.vstate.js<cr>
    au FileType javascript inoreabb <buffer> cpnt <esc>:-1read ~/.vim/.cpnt.vue<cr>

    " Vue Nuxt
    " ,h ,j ,c => go template, script, or style & set filetype
    au FileType javascript nnoremap <buffer> <localleader>h /<template><cr>:
                                             \ setl filetype=html<cr>
    au FileType javascript nnoremap <buffer> <localleader>j /<script><cr>:
                                             \ setl filetype=javascript<cr>zt
    au FileType javascript nnoremap <buffer> <localleader>c /<style<cr>:
                                             \ setl filetype=css<cr>zt
                                             \ :setl filetype=css<cr>
    au FileType javascript nnoremap <buffer> <leader>t diWi<></><esc>F<;pf/pF>
    au FileType javascript inoreabb <buffer> nt this.$nextTick(() => {<cr>})<esc>O//<esc>hh
    au FileType javascript inoreabb <buffer> rp this.$router.push('')<esc>Fhll
    au FileType javascript inoreabb <buffer> vi v-if=""<esc>F=l
    au FileType javascript inoreabb <buffer> acl @click=""<esc>F=l
    au FileType javascript inoreabb <buffer> db {{ }}<esc>F<space>ha
    au FileType javascript inoreabb <buffer> d data() {<cr>return {<cr>};<cr>}<esc>?;<cr>h
    au FileType javascript inoreabb <buffer> c computed: {<cr>},<esc>O//<esc>0wh
    au FileType javascript inoreabb <buffer> vca const app = Vue.createApp({<cr>});
                            \<cr><cr>app.mount('#');<esc>F#h


    au FileType javascript inoreabb <buffer> em this.$emit('')<esc>Ftll
    au FileType javascript inoreabb <buffer> dac defineAsyncComponent<esc>
    au FileType javascript inoreabb <buffer> gt getters
    au FileType javascript inoreabb <buffer> rg rootGetters
    au FileType javascript inoreabb <buffer> 4g state, getters, rootState, rootGetters<esc>
    au FileType javascript inoreabb <buffer> pl payload<esc>
    au FileType javascript inoreabb <buffer> cmp component
    au FileType javascript inoreabb <buffer> cpt computed(() =>)<esc>F=la
    au FileType javascript inoreabb <buffer> meth methods: {<cr>},<esc>O//<esc>0wh
    au FileType javascript inoreabb <buffer> sc this.$store.commit()<esc>Ftl
    au FileType javascript inoreabb <buffer> sg this.$store.getters.<esc>Fs
    au FileType javascript inoreabb <buffer> sd this.$store.dispatch()<esc>Fhl
    au FileType javascript inoreabb <buffer> ctx context<esc>Fx
    au FileType javascript inoreabb <buffer> cc context.commit('')<esc>Ftl
    au FileType javascript inoreabb <buffer> rrp this.$router.replace('')<esc>Fell
    au FileType javascript inoreabb <buffer> mg mapGetters
    au FileType javascript inoreabb <buffer> ma mapActions
    au FileType javascript inoreabb <buffer> irv import { ref } from 'vue';<esc>

    " pwa
    au FileType javascript inoreabb sw serviceWorker<esc>h
    au FileType javascript inoreabb nv navigator<esc>h
    au FileType javascript inoreabb reg navigator.serviceWorker.register('');<esc>Frll
    au FileType javascript inoreabb rsp respondWith()<esc>Fh 

augroup END

"html------------------------------------------------------------
au BufEnter,BufNewFile,BufRead *.ejs,*.njk setl filetype=html
augroup filetype_html
    au! 
    au FileType html colorscheme sonokai
    au FileType html runtime macros/matchit.vim
    au FileType html hi statusline none
    au FileType html nnoremap <buffer> <leader>c O<!-- --><esc>F<space>i<cr><esc>ddp
    au FileType html nnoremap <buffer> <leader>u 0i<space><esc>0w4x/--><cr>3x
    au FileType html nnoremap <buffer> <leader>bc {wO<!--<esc>}a--><esc>
    au FileType html nnoremap <buffer> <leader>ub {w4x}b3x
    au FileType html nnoremap <buffer> <leader>t yypkI<<esc>A><esc>jI</<esc>A><esc>k$h
    au FileType html nnoremap <buffer> <leader>sc diwi< /><esc>F<pE
    au FileType html nnoremap <buffer> <leader><leader>ul :-1read ~/.vim/.list.html<cr>
    au FileType html nnoremap <buffer> <leader><leader>lorem :-1read ~/.vim/.lorem.txt<cr>

    au FileType html inoreabb <buffer> ! <esc>:-1read ~/.vim/.skeleton.html<cr>
    au FileType html inoreabb <buffer> img <img src="" alt=""><esc>Fcll
    au FileType html inoreabb <buffer> href href=""<esc>F=l
    au FileType html inoreabb <buffer> cl class=""<esc>F=l
    au FileType html inoreabb <buffer> req required
    au FileType html inoreabb <buffer> scr <script defer src="script.js"></script><esc>F=l
    

    au FileType html inoreabb <buffer> ejif <% if () { %><cr><% } else { %><cr><% } %>
                                            \<esc>2kff2l
    au FileType html inoreabb <buffer> btt <button class="btn" type="submit"></button><esc>F>;
    au FileType html inoreabb <buffer> ul <ul><cr></ul><esc>O<li><cr></li><esc>O
    au FileType html inoreabb <buffer> id id=""<left>
    au FileType html inoreabb <buffer> for for=""<left>
    au FileType html inoreabb <buffer> rows rows=""<left>
    au FileType html inoreabb <buffer> incl <%- include('') %><esc>Fella
    au FileType html inoreabb <buffer> input <input type="" value="" name=""><esc>Fp<right><right>

    " Vue
    au FileType html inoreabb <buffer> tmp <template></template><esc>Fe;;l
    au FileType html inoreabb <buffer> tg <transition-group></transition-group><esc>
                                          \Fp;li name="" tag=""<esc>hh
    au FileType html inoreabb <buffer> rv <router-view></router-view><esc>
    au FileType html inoreabb <buffer> rl <router-link to=""></router-link><esc>F=l
    au FileType html inoreabb <buffer> vi v-if=""<esc>F=l
    au FileType html inoreabb <buffer> ve v-else<esc>
    au FileType html inoreabb <buffer> vei v-else-if=""<esc>F=l
    au FileType html inoreabb <buffer> vm v-model=""<esc>F=l
    au FileType html inoreabb <buffer> vo v-on:click=""<esc>Fnl
    au FileType html inoreabb <buffer> vf v-for=""<esc>F=l
    au FileType html inoreabb <buffer> vb v-bind:
    au FileType html inoreabb <buffer> vbs :style="{ }"<esc>F=lla
    au FileType html inoreabb <buffer> db {{ }}<esc>F<space>ha
    au FileType html inoreabb <buffer> ac @click=""<esc>F=l
    au FileType html inoreabb <buffer> ach @change=""<esc>F=l
    au FileType html inoreabb <buffer> sl <slot></slot><esc>
    au FileType html inoreabb <buffer> sub @submit.prevent="submitForm"<esc>F=
    au FileType html inoreabb <buffer> clo <client-only><cr></client-only><esc>
augroup END

"css-------------------------------------------------------
au BufEnter,BufNewFile,BufRead *.scss setl filetype=css
augroup filetype_css
    au!
    au FileType css colorscheme sonokai
    au FileType css setlocal shiftwidth=2 tabstop=2
    au FileType css nnoremap <buffer> <leader>[ A {<cr>}<esc>ko
    au FileType css nnoremap <buffer> <leader>; A;<esc> 
    au FileType css nnoremap <buffer> <leader>c O/*<cr>/<esc>ddp
    au FileType css nnoremap <buffer> <leader>u :norm 0xxx<esc>f*xxj
    au FileType css nnoremap <buffer> <leader>h bea:hover<esc>
    au FileType css nnoremap <buffer> <leader>a bea:active<esc>

    au FileType css inoreabb <buffer> r :root {<cr>--varname:<cr>}<esc>k0fvh
    au FileType css inoreabb <buffer> am @media (min-width: rem)<esc>F:l
    au FileType css inoreabb <buffer> kf @keyframes<esc>Fs
    au FileType css inoreabb <buffer> an animation:
    au FileType css inoreabb <buffer> alt alternate
    au FileType css inoreabb <buffer> im !important;<esc>
    au FileType css inoreabb <buffer> wk -webkit-
    au FileType css inoreabb <buffer> mw min-width:
    au FileType css inoreabb <buffer> mh min-height:
    au FileType css inoreabb <buffer> mxw max-width:
    au FileType css inoreabb <buffer> orl orientation: landscape<esc>0
    au FileType css inoreabb <buffer> orp orientation: portrait<esc>0

    " background
    au FileType css inoreabb <buffer> bg background:
    au FileType css inoreabb <buffer> bgc background-color:
    au FileType css inoreabb <buffer> bgi background-image:
    au FileType css inoreabb <buffer> bgs background-size: cover;<esc>
    au FileType css inoreabb <buffer> bgp background-position: center;<esc>
    au FileType css inoreabb <buffer> bgr background-repeat: no-repeat;<esc>
    au FileType css inoreabb <buffer> bgo background-origin: border-box;<esc>
    au FileType css inoreabb <buffer> bgc background-clip: border-box;<esc>
    au FileType css inoreabb <buffer> bga background-attachment: fixed;<esc>
    au FileType css inoreabb <buffer> lg background-image: linear-gradient();<esc>Ft
    au FileType css inoreabb <buffer> rg background-image: radial-gradient();<esc>Ft

    " position
    au FileType css inoreabb <buffer> ctr center;<esc>
    au FileType css inoreabb <buffer> va vertical-align: middle;<esc>Fmh
    au FileType css inoreabb <buffer> oh overflow: hidden;<esc>
    au FileType css inoreabb <buffer> zi z-index:
    au FileType css inoreabb <buffer> pos position:
    au FileType css inoreabb <buffer> pf position: fixed;<esc>
    au FileType css inoreabb <buffer> pa position: absolute;<esc>
    au FileType css inoreabb <buffer> pr position: relative;<esc>
    au FileType css inoreabb <buffer> rel relative;<esc>
    au FileType css inoreabb <buffer> abs absolute;<esc>
    au FileType css inoreabb <buffer> ds display:
    au FileType css inoreabb <buffer> db display: block;<esc>
    au FileType css inoreabb <buffer> dib display: inline-block;<esc>

    " border
    au FileType css inoreabb <buffer> b border:
    au FileType css inoreabb <buffer> bc border-color: ;<esc>F;<left>
    au FileType css inoreabb <buffer> br border-radius: ;<esc>F;<left>
    au FileType css inoreabb <buffer> blc border-left-color
    au FileType css inoreabb <buffer> btc border-top-color
    au FileType css inoreabb <buffer> brc border-right-color
    au FileType css inoreabb <buffer> bbc border-bottom-color

    " font, text
    au FileType css inoreabb <buffer> f font:
    au FileType css inoreabb <buffer> fs font-size:
    au FileType css inoreabb <buffer> fst font-style: italic;<esc>Fi;h
    au FileType css inoreabb <buffer> fw font-weight:
    au FileType css inoreabb <buffer> ff font-family:
    au FileType css inoreabb <buffer> fv font-variant: small-caps;<esc>F:l
    au FileType css inoreabb <buffer> it italic;<esc>
    au FileType css inoreabb <buffer> lh line-height: 2;<esc>F2h
    au FileType css inoreabb <buffer> ws white-space: pre;<esc>Fp
    au FileType css inoreabb <buffer> lsp letter-spacing: 5px;<esc>
    au FileType css inoreabb <buffer> atff @font-face {<cr>font-family: ;<cr>
                             \src: url('');<cr>}<esc>?y<cr>ll

    au FileType css inoreabb <buffer> pct 100%;<esc>F;h
    au FileType css inoreabb <buffer> w width:
    au FileType css inoreabb <buffer> h height:
    au FileType css inoreabb <buffer> fin font: inherit;<esc>
    au FileType css inoreabb <buffer> ta text-align: center;<esc>
    au FileType css inoreabb <buffer> td text-decoration: none;<esc>F:l
    au FileType css inoreabb <buffer> tsh text-shadow: 2px 2px 2px grey;<esc>F:l
    au FileType css inoreabb <buffer> ls list-style: none;<esc>
    au FileType css inoreabb <buffer> c color:
    au FileType css inoreabb <buffer> inh inherit;<esc>
    au FileType css inoreabb <buffer> ol outline:
    au FileType css inoreabb <buffer> on outline: none;<esc>
    au FileType css inoreabb <buffer> moz -moz-appearance: none;<esc>
    au FileType css inoreabb <buffer> ap appearance: none;<esc>
    au FileType css inoreabb <buffer> cn cursor: not-allowed;<esc>

    au FileType css inoreabb <buffer> lst list-style-type: none;<esc>
    au FileType css inoreabb <buffer> mg margin:
    au FileType css inoreabb <buffer> mga margin: auto;<esc>
    au FileType css inoreabb <buffer> mt margin-top:
    au FileType css inoreabb <buffer> mb margin-bottom:
    au FileType css inoreabb <buffer> mbl margin-block:
    au FileType css inoreabb <buffer> mil margin-inline:
    au FileType css inoreabb <buffer> mr margin-right:
    au FileType css inoreabb <buffer> ml margin-left: 0;<esc>F0h
    au FileType css inoreabb <buffer> pd padding: 0;<esc>F0h
    au FileType css inoreabb <buffer> pl padding-left: 0;<esc>F0h
    au FileType css inoreabb <buffer> pr padding-right: 0;<esc>F0h
    au FileType css inoreabb <buffer> pb padding-bottom:
    au FileType css inoreabb <buffer> pt padding-top:
    au FileType css inoreabb <buffer> bs box-sizing: border-box;<esc>
    au FileType css inoreabb <buffer> bsh box-shadow: 3px 3px 3px rgba(0, 0, 0, 0.3);<esc>F:l
    au FileType css inoreabb <buffer> cp cursor: pointer;<esc>

    " grid
    au FileType css inoreabb <buffer> dg display: grid;<esc>
    au FileType css inoreabb <buffer> gt grid-template:
    au FileType css inoreabb <buffer> fc fit-content()<esc>Ftl
    au FileType css inoreabb <buffer> ji justify-items: center;<esc>Fch
    au FileType css inoreabb <buffer> dir direction:
    au FileType css inoreabb <buffer> col column
    au FileType css inoreabb <buffer> gtc grid-template-columns: repeat(2, 15rem);<esc>Fsll
    au FileType css inoreabb <buffer> gtr grid-template-rows: repeat(2, 15rem);<esc>Fsll
    au FileType css inoreabb <buffer> gar grid-auto-rows: minmax(5rem, auto);<esc>Fsll
    au FileType css inoreabb <buffer> gac grid-auto-columns: minmax(5rem, auto);<esc>Fsll
    au FileType css inoreabb <buffer> gaf grid-auto-flow: column;<esc>
    au FileType css inoreabb <buffer> gafd grid-auto-flow: dense;<esc>
    au FileType css inoreabb <buffer> ga grid-area:
    au FileType css inoreabb <buffer> gta grid-template-areas:
    au FileType css inoreabb <buffer> gcs grid-column-start:
    au FileType css inoreabb <buffer> gce grid-column-end:
    au FileType css inoreabb <buffer> gr grid-row: 1 / -1;<esc>Fwll
    au FileType css inoreabb <buffer> gc grid-column: 1 / -1;<esc>Fnll
    au FileType css inoreabb <buffer> grs grid-row-start:
    au FileType css inoreabb <buffer> gre grid-row-end:
    au FileType css inoreabb <buffer> rp repeat();<esc>Ftl
    au FileType css inoreabb <buffer> gcg grid-column-gap: 1rem;<esc>F1h
    au FileType css inoreabb <buffer> grg grid-row-gap: 1rem;<esc>F1h
    au FileType css inoreabb <buffer> gg grid-gap: 1rem 2rem;<esc>F1h
    au FileType css inoreabb <buffer> wb word-break: break-all;<esc>Fbh
    au FileType css inoreabb <buffer> ow overflow-wrap: anywhere;<esc>Fah

    " flex
    au FileType css inoreabb <buffer> wr wrap:
    au FileType css inoreabb <buffer> nw nowrap;<esc>F;h
    au FileType css inoreabb <buffer> df display: flex;<esc>0
    au FileType css inoreabb <buffer> ai align-items: center;<esc>
    au FileType css inoreabb <buffer> jc justify-content: center;<esc>
    au FileType css inoreabb <buffer> jcsb justify-content: space-between;<esc>
    au FileType css inoreabb <buffer> jcsa justify-content: space-around;<esc>
    au FileType css inoreabb <buffer> jcfs justify-content: flex-start;<esc>
    au FileType css inoreabb <buffer> dif display: inline-flex;<esc>
    au FileType css inoreabb <buffer> fd flex-direction: column;<esc>
    au FileType css inoreabb <buffer> flwr flex-wrap: wrap;<esc>
    au FileType css inoreabb <buffer> cr column-reverse;<esc>
    au FileType css inoreabb <buffer> rr row-reverse;<esc>
    au FileType css inoreabb <buffer> ac align-content: space-around;<esc>
    au FileType css inoreabb <buffer> as align-self: flex-start;<esc>Ffh
    au FileType css inoreabb <buffer> o order: 1;<esc>F1h
    au FileType css inoreabb <buffer> flg flex-grow: 1;<esc>F1h
    au FileType css inoreabb <buffer> flsh flex-shrink: 1;<esc>F1h
    au FileType css inoreabb <buffer> fls flex-start;<esc>
    au FileType css inoreabb <buffer> fle flex-end;<esc>
  
    " transition transform
    au FileType css inoreabb <buffer> tf transform: translateY(0);<esc>Frhh
    au FileType css inoreabb <buffer> op opacity: 0;<esc>F0h
    au FileType css inoreabb <buffer> ts transition:
    au FileType css inoreabb <buffer> eio ease-in-out
    au FileType css inoreabb <buffer> tp transition-property:
    au FileType css inoreabb <buffer> trd transition-duration:
    au FileType css inoreabb <buffer> trdl transition-delay:
    au FileType css inoreabb <buffer> trtf transition-timing-function:
    au FileType css inoreabb <buffer> tfo transform-origin: left top;<esc>Frh
    au FileType css inoreabb <buffer> tl translate()<esc>Fe
    au FileType css inoreabb <buffer> tlx translateX()<esc>FX
    au FileType css inoreabb <buffer> tly translateY()<esc>FY
    au FileType css inoreabb <buffer> tlz translateZ()<esc>FZ
    au FileType css inoreabb <buffer> sk skew()<esc>Fw
    au FileType css inoreabb <buffer> skx skewX()<esc>FX
    au FileType css inoreabb <buffer> sky skewY()<esc>FY
    au FileType css inoreabb <buffer> sc scale()<esc>Fe
    au FileType css inoreabb <buffer> scx scaleX()<esc>FX
    au FileType css inoreabb <buffer> scy scaleY()<esc>FY
    au FileType css inoreabb <buffer> scz scaleZ()<esc>FZ
    au FileType css inoreabb <buffer> rt rotate()<esc>Fe
    au FileType css inoreabb <buffer> rtx rotateX(0)<esc>F0h
    au FileType css inoreabb <buffer> rty rotateY(0)<esc>F0h
    au FileType css inoreabb <buffer> rtz rotateZ(0)<esc>F0h
    au FileType css inoreabb <buffer> ps perspective: 1000px;<esc>F1h
    au FileType css inoreabb <buffer> po perspective-origin: right;<esc>F1h
    au FileType css inoreabb <buffer> p3d transform-style: preserve-3d;<esc>
    au FileType css inoreabb <buffer> bfv backface-visibility: hidden;<esc>
    au FileType css inoreabb <buffer> ve .v-enter {<cr>}<esc>k
    au FileType css inoreabb <buffer> vea .v-enter-active {<cr>}<esc>k
    au FileType css inoreabb <buffer> vet .v-enter-to {<cr>}<esc>k
    au FileType css inoreabb <buffer> vl .v-leave {<cr>}<esc>k
    au FileType css inoreabb <buffer> vla .v-leave-active {<cr>}<esc>k
    au FileType css inoreabb <buffer> vlt .v-leave-to {<cr>}<esc>k
    au FileType css inoreabb <buffer> 4v .v-enter-from {<cr>}
                \<esc>o.v-enter-active,<cr>.v-leave-active {<cr>}
                \<esc>o.v-leave-to {<cr>}<esc>
augroup END
"-----------------------------------------------------------------
au BufEnter *.vue set syntax=html
au BufEnter *.njk set syntax=html
"-----------------------------------------------------------------
"lua
au BufEnter,BufNewFile,BufRead *.lua setl filetype=lua
augroup filetype_lua
    autocmd!
    au FileType lua colorscheme PaperColor
    au FileType lua hi StatusLine ctermbg=bg ctermfg=bg
    au FileType lua nnoremap <buffer> <leader>c :norm 0i--<cr>j
augroup END


