export PATH=$(pyenv root)/shims:$PATH
export PATH=$HOME/Documents/Other/cquery/build/release/bin/cquery:$PATH
export PATH=~/.npm-global/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/lib/ruby/gems/2.5.0/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export PATH=/usr/local/anaconda3/bin:"$PATH"
export PATH="/$HOME/google-cloud-sdk/bin:$PATH"
export ANDROID_SDK=/$HOME/Library/Android/sdk
export PATH=/$HOME/Library/Android/sdk:$PATH
export PATH=/$HOME/Library/Android/sdk/platform-tools:$PATH
export PATH=/Applications/MATLAB_R2020a.app/bin:$PATH

# google cloud instance settings
export ZONE="us-east1-c"
export INSTANCE_NAME="my-fastai-instance"
export INSTANCE_TYPE="n1-highmem-8"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"
DEFAULT_USER="$USER"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh plugins
plugins=(
  cargo,
  colored-man-pages,
  gitignore,
  rust,
  ruby,
  emacs,
  zsh-autosuggestions,
  git
)

# fix slow pasting (zsh-autosuggestions)
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish


# change autosuggestion color
typeset -g ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=15'


source $ZSH/oh-my-zsh.sh

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# aliases
alias "c=pbcopy"
alias "v=pbpaste"
alias repo='cd /$HOME/Repo/'

# config is used to manage the git repository
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

gppCompile() {
    file=${1%.*}
    file="${file}"
    g++ -std=c++17 -O2 -Wall "$1" -o "${file}"
}

gccCompile() {
    file=${1%.*}
    file="${file}"
    gcc -Wall "$1" -o "${file}"
}

alias gpp=gppCompile
alias gccc=gccCompile

alias sublime="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'"
alias sl=sublime

alias merge="'/Applications/Sublime Merge.app/Contents/SharedSupport/bin/smerge'"
alias mrg=merge

alias sudo='sudo '

# aliases for unix commands
alias cat='bat'
alias ping='prettyping --nolegend'
alias preview="fzf --preview 'bat --color \"always\" {}'"
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(\"/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl\" {})+abort'"
alias top="sudo htop"
alias ls='exa'
alias find='fd'
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias help='tldr'

alias bes='nodemon --inspect ./bin/start.js'


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/google-cloud-sdk/completion.zsh.inc'; fi
