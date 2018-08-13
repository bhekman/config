" syntax coloring
syntax on

" for plugins
filetype plugin indent on
au FileType xhtml,xml so ~/.vim/ftplugin/html_autoclosetag.vim

" nocompatible
set nocompatible

" Ensure that VAM is installed.
fun! SetupVAM()
  let c = get(g:, 'vim_addon_manager', {})
  let g:vim_addon_manager = c
  let c.plugin_root_dir = expand('$HOME', 1) . '/.vim/vim-addons'
  " most used options you may want to use:
  " let c.log_to_buf = 1
  " let c.auto_install = 0
  let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
  if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '
        \       shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
  endif
  call vam#ActivateAddons([ ], {'auto_install' : 1})
endfun

" My lovely plugins
call SetupVAM()
VAMActivate matchit.zip
VAMActivate vim-addon-commenting
VAMActivate The_NERD_Commenter
VAMActivate The_NERD_tree
VAMActivate fugitive
VAMActivate ctrlp
VAMActivate github:luochen1990/rainbow
VAMActivate github:easymotion/vim-easymotion
VAMActivate ShowTrailingWhitespace
VAMActivate github:digitaltoad/vim-jade
VAMActivate github:octol/vim-cpp-enhanced-highlight  " untested
VAMActivate github:airblade/vim-gitgutter
call vam#ActivateAddons([ 'vim-airline' ])
if v:version > 703
  VAMActivate YouCompleteMe
endif

set term=xterm

" Misc
set hidden
set wildmenu
set wildmode=list:longest
set title
set scrolloff=3
set number
set visualbell

" Fix weird delete key problems
set backspace=2
set backspace=indent,eol,start

" Search Highlighting and clearing
set hlsearch
" Clears search highlighting
nnoremap <silent> ,/ :nohlsearch<CR>  
" Intuitive and pretty searching (ignorecase needed for smartcase)
set smartcase
set ignorecase
" Move search as you type
set incsearch
" Turn on highlighting for searching
nnoremap / :set hls<CR>/
" Searches for current word (not working, use # or *)
"nnoremap <leader>s :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" Coloration
colorscheme desert
set background=dark
hi Search ctermfg=black ctermbg=blue
let &t_Co=256  " tell vim that we support 256 color

" Airline
let g:airline_theme='murmur'
set ttimeoutlen=300
set laststatus=2

" Nerdcommenter shortcut. <C-_> is actually ctrl+/
nnoremap <C-_> <Plug>NERDCommenterToggle

" leader key stuff
set showcmd
let mapleader = ","

" custom maps of awesome
inoremap jk <ESC>
inoremap jK <ESC>
inoremap Jk <ESC>
inoremap JK <ESC>

" Split setup and navigation
nnoremap - :new<CR>
nnoremap \| :vnew<CR>
nnoremap <leader>- :res -5<CR> :vertical resize -5<CR>
nnoremap <leader>+ :res +5<CR> :vertical resize +5<CR>
set splitbelow
set splitright
nnoremap aj <C-W><C-J>
nnoremap ak <C-W><C-K>
nnoremap al <C-W><C-L>
nnoremap ah <C-W><C-H>
" Quicker buffer switching and closing
nnoremap <leader>1 :b1<CR>
nnoremap <leader>2 :b2<CR>
nnoremap <leader>3 :b3<CR>
nnoremap <leader>4 :b4<CR>
nnoremap <leader>5 :b5<CR>
nnoremap <leader>w :bw<CR>

" My preferred tabbing, autoindent features
set autoindent
set nocindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" Toggle paste mode
set pastetoggle=<leader>.

" Highlight column 80, 100, 120:
if exists('+colorcolumn')
  set colorcolumn=120
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" ; === ;
nnoremap ; :

" allows !! to grant sudo commands if forgotten on opening
cnoremap w!! w !sudo tee % >/dev/null

" use tags file
set tags=tags;/

" EasyMotion config (Fixed, but I prefer just using shift to move x5)
"map L <Plug>(easymotion-lineforward)
"map J <Plug>(easymotion-j)
"map K <Plug>(easymotion-k)
"map H <Plug>(easymotion-linebackward)
"let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
" Faster navigation
vnoremap <S-j> 5j
vnoremap <S-k> 5k
vnoremap <S-h> 5h
vnoremap <S-l> 5l
vnoremap <S-w> 5w
nnoremap <S-j> 5j
nnoremap <S-k> 5k
nnoremap <S-h> 5h
nnoremap <S-l> 5l
nnoremap <S-w> 5w
" keep cursor closer to center, for better visibility while ctrl+moving.
set scrolloff=12
" Jump between changed chunks of code
nnoremap an :GitGutterNextHunk<CR>
vnoremap an :GitGutterNextHunk<CR>
nnoremap ab :GitGutterPrevHunk<CR>
vnoremap ab :GitGutterPrevHunk<CR>

" Remap :join, since we use S-j for moving downf fast
nnoremap <C-j> :join<CR>
