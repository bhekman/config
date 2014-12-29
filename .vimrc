" syntax coloring
syntax on

" for plugins
filetype plugin on
filetype plugin indent on
au FileType xhtml,xml so ~/.vim/ftplugin/html_autoclosetag.vim

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

call SetupVAM()
VAMActivate matchit.zip
VAMActivate vim-addon-commenting
VAMActivate The_NERD_Commenter
VAMActivate The_NERD_tree
VAMActivate fugitive
VAMActivate ctrlp
VAMActivate EasyMotion
VAMActivate ShowTrailingWhitespace
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

" Faster navigation
vnoremap <C-j> 5j
vnoremap <C-k> 5k
vnoremap <C-h> 5h
vnoremap <C-l> 5l
nnoremap <C-j> 5j
nnoremap <C-k> 5k
nnoremap <C-h> 5h
nnoremap <C-l> 5l

" Coloration
colorscheme desert
set background=dark
hi Search ctermfg=black ctermbg=blue
let &t_Co=256  " tell vim that we support 256 color

" Airline
let g:airline_theme='murmur'
set ttimeoutlen=300
set laststatus=2

" leader key stuff
set showcmd
let mapleader = ","

" maps of awesome
imap jk <ESC>

" Split setup and navigation
nmap - :new<CR>
nmap \| :vnew<CR>
nmap <leader>- :res -5<CR> :vertical resize -5<CR>
nmap <leader>+ :res +5<CR> :vertical resize +5<CR>
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

" tabbing (2 space)
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" deprecated autofolding
"set foldmethod=indent
"set foldlevel=1
"set foldclose=all

" Toggle paste mode
set pastetoggle=<leader>.

" Search Highlighting
set hlsearch
nmap <silent> ,/ :nohlsearch<CR>  " clears search highlighting
set ignorecase
set incsearch

" Highlight column 80, 100, 120:
if exists('+colorcolumn')
  set colorcolumn=120
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" ; === ;
nnoremap ; :

"nmap <silent> ,/ :nohlsearch<CR>   " clears search highlighting
set ignorecase
set incsearch

" allows !! to grant sudo commands if forgotten on opening
cmap w!! w !sudo tee % >/dev/null

" use tags file
set tags=tags;/

" EasyMotion config (TODO, fix)
" keep cursor closer to center, for better visibility
set scrolloff=15
" don't require leader key to be pressed twice
"map <Leader> <Plug>(easymotion-prefix)
" remember that <leader>w allow word jumping
" h,j,k,l commands
"map <Leader>l <Plug>(easymotion-lineforward)
"map <Leader>j <Plug>(easymotion-j)
"map <Leader>k <Plug>(easymotion-k)
"map <Leader>h <Plug>(easymotion-linebackward)
