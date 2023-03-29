" Plug plugins
"
" After add all plugins, run
" :source %
" Run :PlugInstall
"
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" https://github.com/terryma/vim-multiple-cursors
Plug 'terryma/vim-multiple-cursors'

" http://kien.github.io/ctrlp.vim/#installation
Plug 'kien/ctrlp.vim'

" https://github.com/preservim/nerdtree
Plug 'preservim/nerdtree'

" https://vimawesome.com/plugin/vim-polyglot
" Plug 'sheerun/vim-polyglot'

" https://vimawesome.com/plugin/vim-ruby
Plug 'vim-ruby/vim-ruby'

" https://github.com/tpope/vim-commentary
Plug 'tpope/vim-commentary'

" https://github.com/airblade/vim-gitgutter
Plug 'airblade/vim-gitgutter'

" https://github.com/puremourning/vimspector#installation
" Plug 'puremourning/vimspector'

" https://draculatheme.com/vim
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()
" Plug plugins - END

" syntax on
syntax enable
colorscheme dracula
set ts=2
set bg=dark
set ai
set et
set number

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType html       setlocal shiftwidth=2 tabstop=2

" Para ligar/desligar o set paste com F11
set pastetoggle=<F12>

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes <del> key don't behave weird on iterm
set backspace=indent,eol,start

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
" command RS !docker-compose run --rm rspec %
command RS !rspec %

" Disable cursors
" noremap <Up> <Nop>
" noremap <Down> <Nop>
" noremap <Left> <Nop>
" noremap <Right> <Nop>

" NERDTree plugin
" autocmd vimenter * NERDTree
map <C-x> :NERDTreeToggle<CR> " Ctrl + x -> Toggle nerdtree
map <C-l> :tabn<CR>           " Ctrl + n -> Next tab
map <C-h> :tabp<CR>           " Ctrl + h -> Previous tab
" map <C-n> :tabnew<CR>         " Ctrl + n -> New tab

" Vim Commentary
noremap \ :Commentary<CR>
autocmd FileType ruby setlocal commentstring=#\ %s

" CtrlP
set wildignore+=*/tmp/*,*/log/*,*/node_modules/*,*.so,*.swp,*.zip

" This piece of shit makes del key works on MacOS, instead of makes it
" backspace
inoremap <C-d> <Del>
