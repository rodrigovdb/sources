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

" http://aurelio.net/doc/coluna
" coluna do aurélio 09 [maio/2001]
" vim (um vimrc diferente)"
"
" para aumentar a esperteza e memorização do vim, podemos ter um arquivo
" ~/.viminfo que guardará dados úteis como seu histórico de pesquisas /,
" linha de comando :, marcas `, registradores, entre outros. então com o
" viminfo é  possível copiar uma  linha qualquer (yy),  sair do arquivo,
" abrir um OUTRO arquivo e colar (p) aquela linha copiada anteriormente.
" você pode inclusive nesse intervalo  desligar a máquina e ficar um mês
" de férias, que ao voltar o vim  ainda saberá qual foi a linha copiada.
" não tem contra-indicações. USE!
"
" a segunda linha é uma gambiarra para que ao abrir um arquivo, o cursor
" já fique na  posição que estava na  última vez que ele foi  editado. o
" viminfo guarda a posição de TODOS os arquivos que você editou.
"
set viminfo='10,\"30,:20,%,n~/.viminfo
au BufReadPost * if line("'\"")|execute("normal `\"")|endif

" o vim possui uma linguagem de programação própria,  onde podemos fazer
" funções, e até aplicativos inteiros, como o  vine (leitor de e-mail) e
" o jogo sokoban.vim. mais info sobre o assunto consulte www.vim.org.
"
" mas, como já  temos que fazer  nossos próprios programas, temos opções
" mais acessíveis para automatizar tarefas,  como o mapeamento. aqui vai
" um mapeamento  exclusivo do  modo de inserção (note o i no começo) que
" faz a  função de completação automática  de palavras, procurando-as no
" próprio arquivo. é fácil de usar e nos poupa tempo, além da certeza de
" que a palavra completada está grafada corretamente. então temos:
"
" F7: completa uma palavra
" F8: dá seqüência a essa palavra
"
" os mapeamentos foram  gravados nas teclas F7 e F8,  mas poderia ser em
" qualquer outra. suponha que você se chame Zózimo Gwinch Wurstalinewski
" e digitou seu nome numa parte do texto. depois em outra parte do mesmo
" texto, você precisa colocar seu nome novamente. ê trabalheira.
"
" mas como você  tem esse supermapeamento,  simplesmente digita Zó<F7> e
" surpresa! seu primeiro nome foi completado. e para fazer o resto, você
" continua completando as palavras seguintes com a tecla <F8>, então com
" Zó<F7><F8><F8>, lá está seu nome completo. imbatível.
"
" isso é muito muito útil ao programar, completando nomes de variáveis e
" funções,  geralmente longos e  difíceis,  e que você repete  em várias
" partes do programa.
"
imap <F7> <c-n>
imap <F8> <c-x><c-n>

" e como o capitalismo nos obriga a produzir em velocidade insalubre, ao
" salvar e/ou sair de um arquivo, é comum na pressa digitar o `w` ou `q`
" em maiúsculas, pois você ainda não soltou o dedo do  shift que apertou
" para fazer os dois pontos :.
"
" mas não se desespere!  até para os problemas econômicos mundiais o vim
" tem a solução! basta usarmos abreviações para a linha de comando (Cab)
"
cab W  w
cab Wq wq
cab wQ wq
cab WQ wq
cab Q  q

" um mapeamento é na verdade uma  seqüência de teclas que você apertaria
" normalmente no vim,  para fazer a tarefa.  o ENTER é representado  por
" <cr>, um  crtl+y vira <c-y> e se o  mapeamento exceder uma linha, você
" pode quebrá-la e começar a próxima com um escape \.
"
" um cuidado especial  deve ser tomado ao nomear um mapeamento, para não
" usar  letras ou nomes  que já são  comandos do vim.  para evitar isso,
" sempre inicie o nome de um  mapeamento com uma vírgula. no exemplo, ao
" digitar ,d no modo de comando (não é inserção) aparecerá a data atual.
"
map ,d :r!date<cr>
	\:s/ \(...\) \(..\).*\(....\)$/, \2 de \1 de \3/<cr>
	\:nohl<cr>

" e tem uma dica boa para os  programadores  de plantão. comentários num
" programa são  excelentes, mas  na hora da  sua manutenção,  eles podem
" atrapalhar, pois você queria ver só o código.
"
" para resolver este problema, vamos fazer um  truque no vim. que tal se
" pintarmos os comentários de preto para que fiquem invisíveis?  podemos
" fazer isso redefinindo o componente da cor da sintaxe.  ah! e quem usa
" fundo branco (argh) vai ter que trocar `black` por `white`.
"
" e como somos chiques ainda criamos uma função vim pra fazer o serviço.
" a CommOnOff()  oculta/mostra os comentários, alternando.  o resumão do
" que ela faz é: se a variável global  'hiddcomm'  não existir, a cria e
" oculta os comentários. se já existir, restaura os comentários. por fim
" definimos um mapeamento esperto no F11 para chamar nossa função.
"
" dica: se você está lendo este arquivo no vim, experimente agora mesmo!
"   :so %
"   F11
"   F11
fu! CommOnOff()
	if !exists('g:hiddcomm')
		let g:hiddcomm=1 | hi Comment ctermfg=black guifg=black
	else
		unlet g:hiddcomm | hi Comment ctermfg=cyan  guifg=cyan term=bold
	endif
endfu
map <F11> :call CommOnOff()<cr>

" outra funcionalidade extremamente  interessante é o autocomando, que é
" " executado  automaticamente  dependendo do  nome ou tipo do arquivo, no
" " seu carregamento ou saída do editor.
" "
" " se você tem um arquivo com uma extensão qualquer, como .xyz e quer que
" " o vim o interprete como um arquivo HTML,  diga para o vim configurar o
" " ft (FileType)  ao abrir um arquivo novo  (BufNewFile)  ou já existente
" " (BufRead) com essa extensão.
" "
" au BufNewFile,BufRead *.xyz set ft=html
