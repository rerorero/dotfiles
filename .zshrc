
#fpath=(/usr/local/share/zsh-completions $fpath)

# secret
source $HOME/.secret

######################################################
# prezto
######################################################
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
 source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

######################################################
######################################################
# エイリアスの設定
alias cp='cp -iv'
alias rm='rm -iv'
alias mv='mv -iv'
alias cl='clear'
alias grep='grep --color'

#alias ssh=ssh-host-color

alias ls="ls -G -w -a"
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -alT"
alias l="ls -alT"
alias vi="vim"
alias g="git"
alias ghl='cd $(ghq list -p | peco)'
alias ghg='ghq get'
alias gho='git-open'
alias cio='open https://circleci.com/gh/$(git remote get-url --push origin | sed -e "s/github.com://")/tree/$(git rev-parse --abbrev-ref HEAD)'

# kick browser 
alias firefox="open -a FireFox"
alias safari="open -a Safari"
alias chrome="open /Applications/Google\ Chrome.app"

# docker
alias d="docker"
alias ds='docker stop `docker ps -a -q`'
alias ddc='docker rm -f `docker ps -a -q`'
alias ddi='docker rmi `docker images -q`'
alias ddv='docker volume rm `docker volume ls -q`'
alias ddn='docker network rm `docker network ls -q`'
alias ddall='ddc && ddi && ddv && ddn'
alias dc="docker-compose"

#vimrc
alias vimrc="vim ~/.vimrc"

# kubernetes
alias k='kubectl'
alias kns='export NS=`kubectl get ns | awk '"'"'{print $1}'"'"' | peco`'
alias teledev='kns && AUTHORITY_SERVICE_ENDPOINT=authority-dev.authority.svc.cluster.local:5000 SERVICE_NAME=`basename ${PWD}` GOOGLE_APPLICATION_CREDENTIALS="${HOME}/keys/${NS}.json" telepresence --run-shell --namespace $NS'
alias teleswap='kns && AUTHORITY_SERVICE_ENDPOINT=authority-dev.authority.svc.cluster.local:5000 SERVICE_NAME=`basename ${PWD}` GOOGLE_APPLICATION_CREDENTIALS="${HOME}/keys/${NS}.json" telepresence --run-shell --namespace $NS --swap-deployment `kubectl --namespace $NS get deployment -o jsonpath="{.items[0].metadata.name}"`'

alias kn='kns && kubens $NS'
alias furypanda-ssh-ms='gcloud compute --project "fury-panda" ssh --zone "asia-northeast1-a" "fury-panda-microservices-instance-001"'
#zsh-cmpletions
autoload -Uz compinit
compinit -u

# mvn
export M2_HOME=/usr/local/Cellar/maven/3.5.2
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-11.0.2.jdk/Contents/Home

# rbenv
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
eval "$(rbenv init -)"
export PATH="$PATH:/Library/PostgreSQL/9.3/bin:"
export PATH="$PATH:/usr/local/mysql/bin:"
export PATH="$PATH:/opt/local/bin:"
export PATH="$PATH:/opt/local/sbin/:"
export PATH="$PATH:/usr/local/go/bin:"
export PATH="$PATH:$HOME/packer:"
export PATH="$PATH:$HOME/activator/activator-dist-1.3.5:"
export PATH="$PATH:$M2_HOME/bin:"
export PATH="$PATH:$HOME/.cargo/bin:"
export PATH="$PATH:$HOME/go/bin:"
export RUST_SRC_PATH=~/rust/rust/src
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:$HOME/pear/bin/"



# for GO
export GOPATH=$HOME/go

# vim用
if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
  alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
  alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
fi
if [ -f /usr/local/Cellar/macvim/8.0-144_3/MacVim.app/Contents/MacOS/Vim ]; then
  alias vi='env LANG=ja_JP.UTF-8 /usr/local/Cellar/macvim/8.0-144_3/MacVim.app/Contents/MacOS/Vim "$@"'
  alias vim='env LANG=ja_JP.UTF-8 /usr/local/Cellar/macvim/8.0-144_3/MacVim.app/Contents/MacOS/Vim "$@"'
fi

# for nvm
# source ~/.nvm/nvm.sh
#
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
#
# for nodeenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# kubernetes
# export KUBECONFIG="$KUBECONFIG:`ls $HOME/.kube/config* | tr '\n' ':'`"

source $HOME/.cargo/env

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/rerorero/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/rerorero/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/rerorero/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/rerorero/google-cloud-sdk/completion.zsh.inc'; fi

alias anon='$HOME/anonhelper.sh "$@"'
