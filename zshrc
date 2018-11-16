# Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit"

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
plugins=(git)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
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

function __sdiff() {
    vimdiff $1/summary.yaml $2/summary.yaml
}

function __activate() {
        source $HOME/.p$1/bin/activate
}

if [[ $TERM == xterm ]]; then
    export TERM=xterm-256color;
fi
eval `dircolors $HOME/.dircolors/dircolors.256dark`


## User configuration
export LC_CTYPE=en_US.UTF-8
export LOCAL=$HOME/.local

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64"

export PATH="$LOCAL/bin:$PATH"
export PATH="/usr/local/cuda/bin:$PATH"
export PATH="$HOME/anaconda3/bin:$PATH"
export PATH="$HOME/acha21/.gem/ruby/2.3.0/bin:$PATH"

# key bindings
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

# Aliases
function __download() {
    wget -P "$HOME/downloads" $1
}

function __source_activate() {
    source activate $1
    echo "Current python: $(which python)"
}

function __source_deactivate() {
    source deactivate
    echo "Current python: $(which python)"
}

function __which_python() {
    which python
}

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias tn="tmux new-session -s "
alias ta="tmux attach -t "
alias download="__download"
alias activate="__activate"
alias sa="__source_activate"
alias sd="__source_deactivate"
alias wp="__which_python"
alias sdiff="__sdiff"

# Setopts
setopt extendedglob

. /home/acha21/anaconda3/etc/profile.d/conda.sh

PATH="/home/acha21/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/acha21/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/acha21/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/acha21/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/acha21/perl5"; export PERL_MM_OPT;
