# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="ys"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
plugins=(
  autojump
  git
  source <(kubectl completion zsh)
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export WORKON_HOME='~/.virtualenvs'
export JAVA_7_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home"
export JAVA_8_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home"
export JAVA_HOME=$JAVA_8_HOME
export PATH="~/anaconda3/bin:$PATH"
alias py3='source activate python364'
export SCALA_12_HOME=/usr/local/opt/scala/scala-2.12.4
export SCALA_11_HOME=/usr/local/opt/scala/scala-2.11.4
export SCALA_HOME=$SCALA_12_HOME
export PATH="$SCALA_HOME/bin:$PATH"
export MYSQL_USER=root
export MYSQL_PWD=abcd1234
export PATH=~/.local/bin:$PATH
alias aws-relay='ssh ein@54.222.141.68'
export PATH=/usr/local/bin:$PATH
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/Applications/Racket v7.0/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
# alias tmux="TERM=screen-256color thus -2"
export TERM=screen-256color


export KUBERNETES_PROVIDER=vagrant 
export NUM_MINIONS=3
export GOPATH="/Users/cangyufu/go"
export PATH=$GOPATH/bin:$PATH

export PIPENV_PYPI_MIRROR=http://mirrors.aliyun.com/pypi/simple

export RACKETPATH="/Applications/Racket v7.0/bin"

alias tns="tmux new -s"
alias tat="tmux a -t"
alias tls="tmux ls"
alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
alias ipy36="python3.6 -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
alias ipy37="python3.7 -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"

# alias emacs="emacs -nw"
#
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

alias subot="/Users/cangyufu/.subot/venv/bin/subot"

# config follow https://zhuanlan.zhihu.com/p/48076652

alias cat='bat'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build,venv} --type f"
alias p="fzf --preview 'bat --color \"always\" {}'"
source ~/my-config/z.sh
alias v='vagrant'

alias venv="source venv/bin/activate"

alias diff="colordiff"
