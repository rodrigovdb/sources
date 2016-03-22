call pathogen#infect()

syntax enable
" filetype plugin indent on

" Para ligar/desligar o set paste com F11
set pastetoggle=<F12>

" Tamanho da tabulação
set ts=2

" Background preto
set bg=dark

" Analisador de sintaxe para deixar colorido
syntax on

" Para tabulação continuar da mesma maneira da linha anterior
set ai

" Substitui tabulação por espaços
 set et

" Line numbers
set number

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Highlight espaços no fim da linha
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

map! ,e <emphasis>
map! ,p <para>
map <F3> v/>^Mx

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
