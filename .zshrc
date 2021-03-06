# Path to your oh-my-zsh installation.
export ZSH=/Users/bopeng/.oh-my-zsh
# for tmuxinator
export EDITOR='vim'
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
# ZSH_THEME="pure"
# ZSH_THEME="lambda-mod"
#ZSH_THEME="bureau"
ZSH_THEME="ys"
# ZSH_THEME="michelebologna"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
# plugins=(zsh-completions zsh-autosuggestions git tmux osx z docker zsh-syntax-highlighting)
plugins=(tmux osx z docker zsh-syntax-highlighting)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# especial for git
export LANG=en_US.UTF-8

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

# ignore ctrl-d to close window
# set -o ignoreeof

# alias cnpm="npm --registry=https://registry.npm.taobao.org \
#   --cache=$HOME/.npm/.cache/cnpm \
#   --disturl=https://npm.taobao.org/dist \
#   --userconfig=$HOME/.cnpmrc"
#
alias qnpm="cnpm --registry=http://npm.qiyi.domain:7001 \
  --registryweb=http://npm.qiyi.domain \
  --cache=$HOME/.qnpm/.cache/qnpm \
  --fsevents_binary_host_mirror=https://npm.taobao.org/mirrors/fsevents/ \
  --disturl=https://npm.taobao.org/dist"

alias server='python -m SimpleHTTPServer'
# alias pa='/Users/bopeng/weiyun/pa/scripts/login.sh'

# alias vim='/usr/local/Cellar/macvim/8.0-110/MacVim.app/Contents/MacOS/Vim'
# alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
# alias vim="mvim -v"
alias vi='vim --noplugin'
alias cors='open -a Google\ Chrome\ Canary --args --disable-web-security'
# alias tig='tig --all'

export PATH="/usr/local/sbin:$PATH"

# for mux of tmux
source ~/.bin/tmuxinator.zsh
export DISABLE_AUTO_TITLE=true
alias mux='tmuxinator'

# proxy
# TODO use for here...
# https://unix.stackexchange.com/questions/212894/whats-the-right-format-for-the-http-proxy-environment-variable-caps-or-no-ca
# 这个设置没有官方的标准, 所以最好都设置上
# set | grep -i proxy 可以查看当前的 proxy 设置
alias proxy="export http_proxy=\"socks5://127.0.0.1:1080\" \
  https_proxy=\"socks5://127.0.0.1:1080\" \
  all_proxy=\"socks5://127.0.0.1:1080\" \
  HTTP_PROXY=\"socks5://127.0.0.1:1080\" \
  HTTPS_PROXY=\"socks5://127.0.0.1:1080\" \
  ALL_PROXY=\"socks5://127.0.0.1:1080\""
alias noproxy="unset http_proxy https_proxy all_proxy HTTP_PROXY HTTPS_PROXY ALL_PROXY"
# 用于 betwixt
alias bproxy="export http_proxy=\"http://127.0.0.1:8008\" \
  https_proxy=\"http://127.0.0.1:8008\" \
  all_proxy=\"http://127.0.0.1:8008\" \
  HTTP_PROXY=\"http://127.0.0.1:8008\" \
  HTTPS_PROXY=\"http://127.0.0.1:8008\" \
  ALL_PROXY=\"http://127.0.0.1:8008\""

# https://github.com/neovim/neovim/wiki/FAQ#my-ctrl-h-mapping-doesnt-work
# infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
# tic $TERM.ti

# if [[ ! $TERM =~ screen ]]; then
#   exec tmuxinator start p
# fi

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:~/c/vendor/depot_tools

# https://github.com/notwaldorf/tiny-care-terminal
export TTC_REPOS='/Users/bopeng/c'
export TTC_REPOS_DEPTH=2
export TTC_WEATHER='shanghai'
export TTC_APIKEYS=false

alias qyapm='export QB=root,10.153.164.250,22;ssh pengbo@jumpbox.qiyi.domain -o SendEnv=QB'
alias qypages='export QB=root,10.121.130.224,22;ssh pengbo@jumpbox.qiyi.domain -o SendEnv=QB'
alias adapter='export QB=root,10.110.86.160,22;ssh pengbo@jumpbox.qiyi.domain -o SendEnv=QB'
alias cube='export QB=root,10.57.211.158,22;ssh pengbo@jumpbox.qiyi.domain -o SendEnv=QB'

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT="/Users/bopeng/c/temp/cocos/cocos2d-x/tools/cocos2d-console/bin"
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT="/Users/bopeng/c/temp/cocos"
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT="/Users/bopeng/c/temp/cocos/cocos2d-x/templates"
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
export ANDROID_SDK_ROOT="/Users/bopeng/Library/Android/sdk"
export PATH=$ANDROID_SDK_ROOT:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

# ANT for cocos builder
export ANT_ROOT=/usr/local/bin
