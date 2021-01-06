POWERLEVEL9K_MODE='awesome-patched'

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH:/Users/etienne/Library/Python/2.7/bin

# Path to your oh-my-zsh installation.
if [[ `uname` == 'Linux' ]]; then
  export ZSH=/home/vagrant/.oh-my-zsh
else
  export ZSH=/Users/etienne/.oh-my-zsh
fi

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

if [[ `uname` == 'Linux' ]]; then
  DEFAULT_USER=vagrant
else
  DEFAULT_USER=etienne
fi

# POWERLEVEL9K theme customizations
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)

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
  git
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

if [[ `uname` == 'Linux' ]]; then
  # XDebug
  export XDEBUG_CONFIG="idekey=phpstorm"
  export PHP_IDE_CONFIG="serverName=homestead"

  # Start ssh-agent
  eval `ssh-agent` && ssh-add

  # Link existing aliases
  source ~/.bash_aliases
  source ~/.profile 

  # Dev aliases
  alias behat="./vendor/bin/behat"
  alias clear-logs="rm ./storage/logs/*"

  # Start DynamoDB (Optania API)
  ~/Code/optania-api/dynamodb-local

elif [[ `uname` == 'Darwin' ]]; then
  # Aliases
  alias just-do-it="cd ~/Homestead && vagrant up && vagrant ssh"

  # Optania API machines
  alias ssh-optania-staging-worker-01="ssh -i ~/.ssh/optania-staging.pem ubuntu@ec2-52-60-114-78.ca-central-1.compute.amazonaws.com"
  alias ssh-optania-staging-api-01="ssh -i ~/.ssh/optania-staging.pem ubuntu@ec2-52-60-119-243.ca-central-1.compute.amazonaws.com"
  alias ssh-optania-staging-api-02="ssh -i ~/.ssh/optania-staging.pem ubuntu@ec2-52-60-128-177.ca-central-1.compute.amazonaws.com"
  alias ssh-optania-production-editor="ssh -i ~/.ssh/optania-production.pem ubuntu@ec2-35-182-147-195.ca-central-1.compute.amazonaws.com"
  alias ssh-optania-production-api-01="ssh -i ~/.ssh/optania-production.pem ubuntu@ec2-35-182-129-127.ca-central-1.compute.amazonaws.com"
  alias ssh-optania-production-api-02="ssh -i ~/.ssh/optania-production.pem ubuntu@ec2-35-183-102-100.ca-central-1.compute.amazonaws.com"
  alias ssh-optania-production-worker-01="ssh -i ~/.ssh/optania-production.pem ubuntu@ec2-35-182-84-15.ca-central-1.compute.amazonaws.com"
  alias ssh-optania-production-worker-02="ssh -i ~/.ssh/optania-production.pem ubuntu@ec2-99-79-195-113.ca-central-1.compute.amazonaws.com"
fi

  # SAM machines
  alias ssh-sam-ml-engine="ssh -i ~/.ssh/sam-ml-engine.pem ubuntu@ec2-54-81-39-218.compute-1.amazonaws.com"

alias git-clean-branches="git fetch -p && git branch -vv | grep ': gone]' | awk '{print $1}' | xargs git branch -D"


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
