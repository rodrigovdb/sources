# Zsh Configuration
export ZSH=/home/rodrigo/.oh-my-zsh
ZSH_THEME="alanpeabody"

plugins=(
  rake
  docker
  docker-compose
)

source $ZSH/oh-my-zsh.sh

# User Configuration

export EDITOR='vim'

alias ls='ls --color=auto --group-directories-first'
alias la='ls -la --color=auto --group-directories-first'
alias l='ls -la --color=auto --group-directories-first'
alias please='sudo'
alias ccat='bat'

## Docker Compose aliases
alias rs='docker-compose run --rm api rspec'
alias rc='docker-compose run --rm api rubocop -a'

# RVM and ~/bin
export PATH="$PATH:$HOME/.rvm/bin:$HOME/bin"
source ~/.rvm/scripts/rvm

# Python PIP
# export PATH="$PATH:/home/rodrigo/.local/bin"

# PyEnv
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"

# Rust
# source $HOME/.cargo/env

# Oracle
# export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
# export ORACLE_HOME=/usr/lib/oracle/12.1/client64
# export PATH=$PATH:$ORACLE_HOME/bin
# export LC_ALL=en_US.UTF-8
# export LANG=en_US.UTF-8
# export LANGUAGE=en_US:en

# GoLang
export GOPATH="/home/rodrigo/sandbox/rodrigovdb/golang"
export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/rodrigo/.nvm/versions/node/v10.16.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/rodrigo/.nvm/versions/node/v10.16.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/rodrigo/.nvm/versions/node/v10.16.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /home/rodrigo/.nvm/versions/node/v10.16.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /home/rodrigo/.nvm/versions/node/v10.16.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /home/rodrigo/.nvm/versions/node/v10.16.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh
