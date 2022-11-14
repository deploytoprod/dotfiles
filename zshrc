# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Path to your oh-my-zsh installation.
export ZSH=/Users/`whoami`/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel10k/powerlevel10k"
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(return battery ram)
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
#POWERLEVEL9K_MODE='awesome-patched'
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator dir nvm vcs)
#POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
#POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
#POWERLEVEL9K_NVM_BACKGROUND='28'
#POWERLEVEL9K_NVM_FOREGROUND='15'
#POWERLEVEL9K_TIME_FORMAT="%D{%H:%M \uE868  %d.%m}"

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
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
plugins=(aws git zsh-syntax-highlighting wd sublime brew)

# User configuration

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/`whoami`/.local:/Users/`whoami`/.gem/ruby/2.0.0/bin:/Users/`whoami`/.mos/bin:/Users/`whoami`/Library/Python/2.7/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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
alias pg="ping 8.8.8.8"
alias banner="figlet"
alias cow="cowthink"
alias watch="watch -n 1"
alias js="bundle exec jekyll serve"
alias jb="bundle exec jekyll build"
alias lookbusy="cat /dev/urandom | hexdump -C | grep \"34 32\""
alias c="clear"
alias conn="ssh pi@int.raspi.rafalop.es"
alias boeing="chmod"
alias weather='curl -s http://wttr.in/\?1m |head -17'
alias t="todo.sh"
alias todo="todo.sh"
alias tls="todo.sh ls"
alias tlsp="todo.sh lsp"
alias tbu="echo 'Tasks assigned by Buni:' && todo.sh |grep Buni"
alias moo="cow"
alias focker="docker"
alias cal="cal -y"
alias chmodql="chmod 400 ~/Downloads/qwik*"
alias jsonfix="pbpaste | jq . | pbcopy"
alias getstudents="aws dynamodb scan --table-name students-registration --query 'Items[*].Text' --output text"
alias python='python3'
alias k='kubectl'
alias e='eksctl'
alias removemouseacceleration='defaults write .GlobalPreferences com.apple.mouse.scaling -1'
alias midirelay='/Users/freitasr/Dev/midi-relay2.2.0-macos-x64/midi-relay-macos'

#source /Users/freitasr/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh
#source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh #Powerline here we go!
#weather
removemouseacceleration
#export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH=$HOME/.gem/ruby/2.5.0/bin:$PATH
export PATH="/usr/local/opt/ruby@2.5/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
source /usr/local/opt/chruby/share/chruby/chruby.sh
