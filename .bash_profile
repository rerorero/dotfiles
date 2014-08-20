# プロンプトの設定
PS1='[\u \W]\$ '

# カラー設定
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

# エイリアスの設定
alias cp='cp -iv'
alias rm='rm -iv'
alias mv='mv -iv'
alias cl='clear'
alias grep='grep --color'

alias ls="ls -G -w -a"
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -al"

# rbenv
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"

export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:"
export PATH="$PATH:/usr/local/apache-maven-3.2.1/bin:"
export PATH="$PATH:/Library/PostgreSQL/9.3/bin:"
export PATH="$PATH:/Users/nato/tools/play/play-2.2.1:"
export PATH="$PATH:/usr/local/mysql/bin:"
export PATH="$PATH:/opt/local/bin:"
export PATH="$PATH:/opt/local/sbin/:"
