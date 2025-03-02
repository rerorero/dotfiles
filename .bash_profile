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
alias ll="ls -alT"
alias vi="vim"

# mvn
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home
export M2_HOME=/usr/local/apache-maven-3.3.9

# rbenv
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export PATH="$PATH:/usr/local/apache-maven-3.3.9/bin:"
export PATH="$PATH:/Library/PostgreSQL/9.3/bin:"
export PATH="$PATH:/Users/nato/tools/play/play-2.2.1:"
export PATH="$PATH:/usr/local/mysql/bin:"
export PATH="$PATH:/opt/local/bin:"
export PATH="$PATH:/opt/local/sbin/:"
export PATH="$PATH:$M2_HOME/bin/:"


# vim用
if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
  alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
  alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
fi

# ctags
alias ctags='/Applications/MacVim.app/Contents/MacOS/ctags "$@"'

# added by Anaconda2 4.1.1 installer
export PATH="/Users/ryo_natori/anaconda/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export ANYENV_ROOT="/Users/rerorero/.anyenv"
export PATH=$PATH:"/Users/rerorero/.anyenv/bin"
eval "$(anyenv init -)"
export PATH="$(brew --prefix php@7.1)/bin:$PATH"


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/rerorero/.sdkman"
[[ -s "/Users/rerorero/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/rerorero/.sdkman/bin/sdkman-init.sh"

export PATH="$HOME/.poetry/bin:$PATH"
. "$HOME/.cargo/env"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

