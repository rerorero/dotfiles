# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

fpath=(/usr/local/share/zsh-completions $fpath)

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="wedisagree"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ruby osx brew rails emoji-clock)

source $ZSH/oh-my-zsh.sh

# User configuration

#export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/ryo_natori/.rbenv/bin:/Users/ryo_natori/.rbenv/shims:/usr/local/apache-maven-3.2.1/bin:/Library/PostgreSQL/9.3/bin:/Users/nato/tools/play/play-2.2.1:/usr/local/mysql/bin:/opt/local/bin:/opt/local/sbin/"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



######################################################
######################################################
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

# rbenv
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export PATH="$PATH:/usr/local/apache-maven-3.2.1/bin:"
export PATH="$PATH:/Library/PostgreSQL/9.3/bin:"
export PATH="$PATH:/usr/local/mysql/bin:"
export PATH="$PATH:/opt/local/bin:"
export PATH="$PATH:/opt/local/sbin/:"
export PATH="$PATH:/usr/local/go/bin:"

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


