
#fpath=(/usr/local/share/zsh-completions $fpath)


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

# kick browser 
alias firefox="open -a FireFox"
alias safari="open -a Safari"
alias chrome="open /Applications/Google\ Chrome.app"

#vimrc
alias vimrc="vim ~/.vimrc"

#zsh-cmpletions
autoload -Uz compinit
compinit -u

# mvn
export M2_HOME=/usr/local/apache-maven-3.3.9
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home

# rbenv
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
eval "$(rbenv init -)"
export PATH="$PATH:/usr/local/apache-maven-3.3.9/bin:"
export PATH="$PATH:/Library/PostgreSQL/9.3/bin:"
export PATH="$PATH:/usr/local/mysql/bin:"
export PATH="$PATH:/opt/local/bin:"
export PATH="$PATH:/opt/local/sbin/:"
export PATH="$PATH:/usr/local/go/bin:"
export PATH="$PATH:$HOME/activator/activator-dist-1.3.5:"
export PATH="$PATH:$M2_HOME/bin:"
export PATH="$PATH:$HOME/.cargo/bin:"
export RUST_SRC_PATH=~/rust/rust/src


# for GO
export GOPATH=$HOME/go

# vim用
if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
  alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
  alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
fi

# ctags
alias ctags='/Applications/MacVim.app/Contents/MacOS/ctags "$@"'

# for nvm
source ~/.nvm/nvm.sh

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

export PHANTOMJS_BIN=/Users/ryo_natori/.nvm/versions/v5.8.0/lib/node_modules/karma-phantomjs-launcher/node_modules/phantomjs-prebuilt/lib/phantom/bin/phantomjs

