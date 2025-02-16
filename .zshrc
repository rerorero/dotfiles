
#fpath=(/usr/local/share/zsh-completions $fpath)

# secret
source $HOME/.secret

######################################################
# zsh
######################################################
export HISTFILE="${HOME}/.zsh_history"
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

######################################################
# prezto
######################################################
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  # workaround for claude-code
  # https://github.com/anthropics/claude-code/issues/783
  if [[ -z "${CLAUDECODE}" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
  fi
fi

# PROMPT
if [[ -z "${VIM}" ]]; then
  emojiset="😏😇😻😎🧐🤪😣😱😤😭🥶🙄🤮👻🤣㊗️"
  emoji="${emojiset:$(( RANDOM % ${#emojiset} )):1}"
  PROMPT="${emoji} %F{green}%1d%f ${emoji} "
else
  # terminal in VIM
  PROMPT="%F{green}%1d%f "
fi

# Customize to your needs...

######################################################
######################################################
# エイリアスの設定
alias cp='cp -iv'
alias cpf='cp -rf'
alias rm='rm -iv'
alias mv='mv -iv'
alias cl='clear'
alias grep='grep --color'

#alias ssh=ssh-host-color

alias ls="ls -G -a"
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -alt"
alias l="ls -alt"
alias vi="nvim"
alias g="git"
alias ghl='cd $(ghq list -p | peco)'
alias ghg='ghq get'
alias gho='git-open'
alias cio='open https://circleci.com/gh/$(git remote get-url --push origin | sed -e "s/github.com://")/tree/$(git rev-parse --abbrev-ref HEAD)'
alias t="tig"
# export GIT_SSH_COMMAND="ssh -i $HOME/.ssh/id_ed25519_github -o IdentitiesOnly=yes"

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
alias dc="docker compose"

#vimrc
alias vimrc="vim ~/.vimrc"

# kubernetes
alias k='kubectl'
alias kd='kubectl describe'
alias kg='kubectl get'
alias kl='kubectl logs'
alias kns='export NS=`kubectl get ns | awk '"'"'{print $1}'"'"' | peco`'
alias teledev='kns && SERVICE_NAME=`basename ${PWD}` GOOGLE_APPLICATION_CREDENTIALS="${HOME}/keys/${NS}.json" telepresence --run-shell --namespace $NS'
alias teleswap='kns && SERVICE_NAME=`basename ${PWD}` GOOGLE_APPLICATION_CREDENTIALS="${HOME}/keys/${NS}.json" telepresence --namespace $NS --swap-deployment `kubectl --namespace $NS get deployment -o jsonpath="{.items[0].metadata.name}"`'
alias telenew='kns && SERVICE_NAME=`basename ${PWD}` GOOGLE_APPLICATION_CREDENTIALS="${HOME}/keys/${NS}.json" telepresence --namespace $NS --new-deployment rerorero --expose '

alias kn='kns && kubens $NS'
#zsh-cmpletions
# autoload -Uz compinit
# compinit -u

# Flink
export FLINK_HOME="/usr/local/Cellar/apache-flink/1.12.1/libexec"

# kubernetes
# export KUBECONFIG="$KUBECONFIG:`ls $HOME/.kube/config* | tr '\n' ':'`"

source $HOME/.cargo/env

# brew
if [ -d "/opt/homebrew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi


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
export PATH="$HOME/.tfenv/bin:$PATH"
export PATH="/usr/local/opt/php@7.3/bin:$PATH"
export PATH="/usr/local/opt/php@7.3/sbin:$PATH"
export PATH="$HOME/istio/bin:$PATH"
export PATH="$HOME/nvim-osx64/bin:$PATH"
export PATH="/usr/local/Cellar/openssl@1.1/1.1.1g/bin:$PATH"
export PATH="$FLINK_HOME/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/spark/bin:$PATH"
export PATH="$HOME/ccloud-cli/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
# export PATH="$HOME/.pyenv/bin:$PATH"

# for GO
export GOPATH=$HOME/go
export GOPRIVATE=github.com/kouzoh

# for nvm
source ~/.nvm/nvm.sh

# for mise
eval "$(~/.local/bin/mise activate zsh)"

#
# if which pyenv > /dev/null; then eval "$(pyenv init --path)"; fi
# if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi #
source "$HOME/.rye/env"
alias vv='source ./.venv/bin/activate'

alias anon='$HOME/anonhelper.sh "$@"'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# iterm tab
if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
fi

# display directory name on iterm2 tab
function chpwd() { echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print $1}'| rev)\007"}

# for profiling
# if (which zprof > /dev/null 2>&1) ;then
#   zprof
# fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="~/.sdkman"
[[ -s "~/.sdkman/bin/sdkman-init.sh" ]] && source "~/.sdkman/bin/sdkman-init.sh"

# antlr
export CLASSPATH=".:/usr/local/lib/antlr-4.9.2-complete.jar:$CLASSPATH"
alias antlr4='java -jar /usr/local/lib/antlr-4.9.2-complete.jar'
alias grun='java org.antlr.v4.gui.TestRig'

ssh-add --apple-use-keychain ~/.ssh/id_ed25519_github
export GPG_TTY=$TTY

# Android
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/emulator:$PATH"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# workaround for spring
# https://github.com/rails/rails/issues/38560
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/rerorero/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/rerorero/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/rerorero/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/rerorero/google-cloud-sdk/completion.zsh.inc'; fi

case `uname -a` in
  Darwin* )
    # mvn
    export M2_HOME=/usr/local/Cellar/maven/3.5.2
    export JAVA_HOME="/opt/homebrew/opt/openjdk@11/"
    ;;
  Linux* )
    export PATH=/usr/local/cuda:/usr/local/cuda/bin:$PATH
    export LD_LIBRARY_PATH=/usr/local/lib:/usr/local/cuda/lib64:$LD_LIBRARY_PATH
    ;;
esac

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/rerorero/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/rerorero/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/rerorero/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/rerorero/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
