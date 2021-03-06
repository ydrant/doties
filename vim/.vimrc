set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle "vim-airline/vim-airline"
Bundle 'vim-airline/vim-airline-themes'
Bundle "scrooloose/syntastic"
Bundle 'vim-scripts/comments.vim'
Bundle 'vim-scripts/a.vim'
Bundle 'vim-scripts/rainbow_parentheses.vim'
Bundle 'henrik/vim-indexed-search'

" Theme
Bundle 'altercation/vim-colors-solarized'
Bundle 'Pychimp/vim-luna'

Bundle 'ekalinin/Dockerfile.vim'
" Build this extension
" cd ~/.vim/bundle/YouCompleteMe
" ./install.sh --clang-completer
" Bundle 'Valloric/YouCompleteMe'

Bundle 'kien/ctrlp.vim'

" Add cool stuff for tmux
Bundle 'jgdavey/tslime.vim'

filetype plugin indent on

syntax on
" pratique sur des machine puissance
set ttyfast
"""""""
" :ai indent automatique pour tous
set autoindent

" gestion des tabulation par défaut
" :ts
set tabstop=2
set softtabstop=2
set shiftwidth=2
"set
set expandtab

set encoding=utf-8
set scrolloff=3

""" recherche
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set ignorecase          " Do case insensitive matching
set hlsearch            " hihg light the research

set hidden              " permet ouvrir un autre buffer sans enregistrer les modif de suite

set history=1000

"if isdirectory($HOME . '/.vim/tmp') == 0
  ":silent !mkdir -p ~/.vim/tmp > /dev/null 2>&1
"endif

"" backup
set backup
"set backupdir=~/tmp/vim
"set bex=.bak
"set directory=~/tmp/vim   " swap files
set noswapfile            " It's 2012, Vim.

set background=dark

set cursorline

" affichage des lignes
set number
" nombre relatif
set relativenumber

" 5 cols utilisées
set numberwidth=5

" set list listchars=tab:>-,eol:¶
" https://wincent.com/blog/making-vim-highlight-suspicious-characters
set list listchars=nbsp:¬,tab:>-,eol:¶,extends:>,precedes:<,trail:-

let maplocalleader = "!"
if has('gui_running')
  " choix du theme
  " http://www.cs.cmu.edu/~maverick/VimColorSchemeTest/ has examples and
  " downloads for the colorschemes on vim.org

  " changer de themes en fonction du mode ....
  " au InsertEnter * :colo oceandeep_red
  " au InsertLeave * :colo oceandeep

  " choix de la police
  "set guifont=MonoSpace\ 10
  "set guifont=Ubuntu\ Mono\ for\ Powerline\ 14
  set guifont=SourceCodePro\ for\ Powerline\ 10

  " surligne la ligne courrante


  " pas d'éléments sur la gui useless...
  set guioptions-=m
  set guioptions-=T
  set guioptions-=l
  set guioptions-=L
  set guioptions-=r
  set guioptions-=R
  colorscheme solarized
  "colorscheme luna

  "" affiche les tab etc...
  " tab : tabulations
  " trail : espace en fin de ligne
  set foldmethod=syntax
  set foldenable
  set foldcolumn=5

endif
  " sans gui
set t_Co=16
set background=dark
colorscheme solarized
set foldlevel=100 " on ne veut pas que tout soit fermer à chaque fois

"" Edition
" pas de coupure de ligne
set nowrap
" affiche les '{,} (,), [,]' qui correspondent
set showmatch

" Alertes
" pas d'alerte visuelle
set visualbell t_vb=

set modeline
set ruler
set laststatus=2

" affiche les commandes
set showcmd
" affiche le mode courant INSERT, VISUAL, COMMAND ...
set showmode
" Active le menu pour le menu dans la bar en bas
set wildmenu
"set wildmode=list:full
set wildignore+=*.mp3,*.zip,*.wav,*.dat,*.png,*.jpg,*.gif,rake/**,solr/**,*.yml,tmp/**,*.log,*~

set pastetoggle=<F2>

if exists('&colorcolumn')
  set colorcolumn=80
else
   "Colorise la 80 colonne et apres 120eme ...
  let &colorcolumn=80,".join(range(120,999),",")
  highlight ColorColumn ctermbg=235 guibg=#073642
endif

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir+=~/.vim/undo/
  set undofile
endif

function! NumberToggle()
  set number!
  set relativenumber!
endfunc

nnoremap <C-l> :call NumberToggle()<cr>
"else
  "au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
"endif

"let mapleader = ","

" gestion des fichiers
"

if has("autocmd")

  " affiche les espaces en fin de ligne
  au Syntax * syn match Error /\s\+$/

  " réouverture des fichiers à la même position
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " fichier C/C++

  " fichier python
  au FileType python set expandtab tabstop=4 softtabstop=4 shiftwidth=4 foldmethod=indent

  " fichier Make
  au FileType make set noexpandtab shiftwidth=4

  " fichier VIMRC
  au FileType vim set foldmethod=indent foldcolumn=1

  " fichiers R
  au BufNewFile,BufRead *.R,*.r set guioptions+=m
  au BufNewFile,BufRead *.r,*.R set ft=r

  " LISP
  au BufNewFile,BufRead *.scm set ft=lisp
  au BufNewFile,BufRead *.lsh set ft=lisp
  au BufNewFile,BufRead *.kml set ft=lisp

  " fichier tex/mail
  au FileType mail,tex set textwidth=72
  au FileType tex set fenc=utf8 spell spelllang=fr

  " reconnaissance des fichiers
  au BufNewFile,BufRead *.conf set ft=dosini
  au BufNewFile,BufRead *.conf.ini set ft=dosini

  " LaTeX settings
  au BufNewFile,BufRead *.ldf,*.dtx,*.ins set ft=tex

  " PHP3
  au BufNewFile,BufRead *.incl set ft=php

  " KML
  au BufNewFile,BufRead *.kml set ft=lush
  au BufNewFile,BufRead *.lsh set ft=lush

  " CPP
  au BufNewFile,BufRead *.cpp,*.hpp,*.mq4 set ft=cpp

  au BufNewFile,BufRead *.nw set ft=noweb
  let noweb_backend="tex"
  let noweb_language="ocaml"
  let noweb_fold_code=1

  " automatically delete trailing DOS-returns and trailing whitespaces
  autocmd BufWritePre *.c,*.h,*.y,*.yy,*.l,*.ll,*.C,*.cpp,*.hh,*.cc,*.hxx,*.cxx,*.hpp,*.html,*.java,*.rb,*.py,*.m4,*.pl,*.pm,*.js,.vimrc,*.sql silent! %s/[\r \t]\+$//

endif


" Mapping
:nmap <C-S-tab> :wincmd p<cr>
:nmap <C-tab> :wincmd w<cr>
:map <C-S-tab> :wincmd p<cr>
:map <C-tab> :wincmd w<cr>
:imap <C-S-tab> <ESC>:wincmd p<cr>i
:imap <C-tab> <ESC>:wincmd w<cr>i

let c_gnu=1               " Highlight GNU gcc specific items ...
let c_space_errors=1      " ... and trailing spaces before a <Tab>

" for the TOhtml command
let g:html_use_css = 1
let g:html_use_encoding = "utf8"
let g:use_xhtml = 1


""""""""""""""""""""""""""""""
" From an idea by Michael Naumann
function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"
  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")
  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  else
    execute "normal /" . l:pattern . "^M"
  endif
  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

"Basically you press * or # to search for the current selection !! Really useful
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>


set magic

"let vimtdir=$HOME . '/tmp'
"let &viminfo="'20," . '%,n' . vimtdir . '/.viminfo'

"------------------------------------------------------------------------------
" Local settings.
"------------------------------------------------------------------------------

" Source a local configuration file if available.
if filereadable(expand("~/.vim/vimrc.local"))
  source ~/.vim/vimrc.local
endif
if filereadable(expand("~/.vim/vimrc.plugins"))
  source ~/.vim/vimrc.plugins
endif


" Reselect visual block after indent:
vnoremap < <gv
vnoremap > >gv
"
" " Make Y behave like other capitals
nnoremap Y y$
"
" " Force Saving Files that Require Root Permission
cmap w!! %!sudo tee > /dev/null %


set t_ut=

" from http://vim.wikia.com/wiki/Modeline_magic
" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>


" Colorise la 80 colonne et apres 120eme ...
let &colorcolumn="80,".join(range(120,999),",")
highlight ColorColumn ctermbg=235 guibg=#073642


"" PLUGIN
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


"" Plugin tslime
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

" Airline
let g:airline_powerline_fonts = 1

" deactivate arrow
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>


" Syntastic
let g:syntastic_error_symbol = 'x'
let g:syntastic_style_error_symbol = '+'
let g:syntastic_warning_symbol = '!'
let g:syntastic_style_warning_symbol = '='
let g:syntastic_python_checkers = ['pylint', 'pyflakes', 'pep8']

" Testing

" clean the other line
let mapleader = "\<Space>"
set backspace=2 " make backspace work like most other apps
" j
" Copy & paste to system clipboard with <Space>p and <Space>y:
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Map Ctrl-A -> Start of line, Ctrl-E -> End of line
map <C-a> <Home>
map <C-e> <End>
"" vim: set ts=2 sw=2 tw=78 et :
