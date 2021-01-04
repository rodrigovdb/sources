" call pathogen#infect()
execute pathogen#infect()

" Plug plugins
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" http://kien.github.io/ctrlp.vim/#installation
Plug 'kien/ctrlp.vim'

call plug#end()
" Plug plugins - END

syntax on
set ts=2
set bg=dark
set ai
 set et
set number

" Para ligar/desligar o set paste com F11
set pastetoggle=<F12>

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Folding stuff. See http://vim.wikia.com/wiki/Folding and use zc / za
setlocal foldmethod=syntax
setlocal foldlevelstart=20

" Highlight espaços no fim da linha
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

" Habilitar highlights
" Twig
au BufRead,BufNewFile *.twig set filetype=htmljinja

" Armazenda no ~/.viminfo o histórico de comandos executados
set viminfo='10,\"30,:20,%,n~/.viminfo

" Lembra a linha / coluna do arquivo quando aberto pela última vez
au BufReadPost * if line("'\"")|execute("normal `\"")|endif

" Alias para comandos digitados errados
cab W   w
cab Q   q
cab X   x
cab Wa  wa
cab wA  wa
cab WA  wa
cab Wq  wq
cab wQ  wq
cab WQ  wq
cab Qa  qa
cab qA  qa
cab Xa  xa
cab xA  xa
cab XA  xa

" Insere require "pry"; binding.pry
command P :normal i require "pry"; binding.pry<ESC>
" puts "\n\n" debug
command D :normal i puts "\n\n"; puts '#' * 90; puts ""; puts '#' * 90; puts "\n"

" Disable cursors
" noremap <Up> <Nop>
" noremap <Down> <Nop>
" noremap <Left> <Nop>
" noremap <Right> <Nop>

" Additional configs
source $HOME/.vim/config/nerdtree.vim

" Database aliases
let g:local   = "postgresql://postgres:postgres@localhost/arca-embarcai-sales_development"
let g:staging = "postgresql://axdzvtraxrtevb:bbb6521be5430b164323e5f2bc61cb841baf5dd9d84d48ff3a0ad6e12db819f0@ec2-52-71-85-210.compute-1.amazonaws.com/dela0uurr1ge7k"
