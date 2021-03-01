export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="alanpeabody"
plugins=(
    git
    golang
    history
    history-substring-search
    sudo
    osx
    lein
    node
    npm
    jump
    mosh
    k
    z
    zsh-completions
    almostontop
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# set vim commands to zsh
# set -o vi
# bindkey -v

## ALIAS
alias c="clear"
alias n="nvim"
alias ez="vi $HOME/.zshrc"
# Share screen with VLC to Google Meet
# [ 0,    0, 1920, 1080] for my entire left screen
# [ 0, 1920, 1920, 1080] for my entire right screen
alias meet="vlc --no-video-deco --no-embedded-video --screen-fps=30 --screen-top=32  --screen-left=0  --screen-width=1920  --screen-height=1000  screen://"

## GIT
GIT_AUTHOR_NAME="Chavita1386"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="chavita1386@gmail.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
git config --global credential.helper "cache --timeout 9200"
git config --global core.editor "nvim"

#export PATH=$PATH:~/
# NPM Global without sudo
# mkdir "${HOME}/.npm-packages"
# npm config set prefix "${HOME}/.npm-packages"
NPM_PACKAGES="${HOME}/.npm-global"
export PATH="$PATH:$NPM_PACKAGES/bin"
# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
## NPM
npm set init.author.email "chavita1386@gmail.com"
npm set init.author.name "Chavita1386"
npm set init.license "MIT"


## File watcher
#sysctl -p

##### EXPORT

# Node.JS
export PATH="$PATH:`yarn global bin`"
export PATH=~/.npm-global/bin:$PATH

## JAVA / CLOJURE
export JAVA_HOME=$(which java)
export M2=$HOME/.m2
export PATH=$PATH:$M2

## GO
export GOPATH=$HOME/code/go
export PATH=$GOPATH:$PATH
export PATH=$HOME/code/go/bin:$PATH
## Rust
export PATH=$HOME/.cargo/env:$PATH

## Pure theme
#fpath+=$HOME/.zsh/pure
#autoload -U promptinit; promptinit
# optionally define some options
PURE_CMD_MAX_EXEC_TIME=10
# change the path color
zstyle :prompt:pure:path color '#96caf2'
# change the color for both `prompt:success` and `prompt:error`
# zstyle ':prompt:pure:prompt:*' color '#EBC5EE'
zstyle :prompt:pure color '#EBC5EE'
# turn on git stash status
zstyle :prompt:pure:git:stash show yes
#prompt pure


## CUSTOM FUNCTIONS
# Cd to render
function ninit() {
  nvim ~/.config/nvim/init.vim
}

function nzsh() {
  nvim ~/.zshrc
}

function nterminal() {
  nvim ~/.config/alacritty/alacritty.yml
}

#function ni3() {
  #nvim ~/.config/i3/config
#}

function log() {
  git log --graph --pretty=format:'%C(auto)%h%d (%cr) %cn <%ce> %s'
}

function pushConfig() {
  cp ~/.zshrc ~/dotfiles/.zshrc &&
  cp -R ~/.config/nvim ~/dotfiles/.config/ &&
  cp ~/.config/alacritty/alacritty.yml ~/dotfiles/.config/alacritty/alacritty.yml &&
  cp ~/.vimrc ~/dotfiles/.vimrc &&
  #cp ~/.config/i3/config ~/dotfiles/.config/i3/config
}

function pullConfig() {
	cp  ~/dotfiles/.zshrc ~/.zshrc &&
  cp -R ~/dotfiles/.config/nvim/ ~/.config/nvim &&
  cp ~/dotfiles/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml &&
  cp ~/dotfiles/.vimrc ~/.vimrc &&
  #cp ~/dotfiles/.config/i3/config ~/.config/i3/config
}

function cdcode() {
  cd ~/code
}
# cd to exercism
function cdExercism() {
  cd ~/snap/exercism/5/exercism/go/
}
# cd to go path
function cdgo() {
  cd ~/code/go/src/github.com/chavita1386
}
# cd to js folder projects
function cdjs() {
	cd ~/code/js
}
# cd to typescript folder
function cdtypescript() {
	cd ~/code/js/typescript/github.com/chavita1386
}

function windowClass() {
  xprop | grep WM_CLASS | awk '{ print $4 }'
}
# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
}
function mdt() {
    markdown "$*" | lynx -stdin
}

function mdb() {
    local TMPFILE=$(mktemp)
    markdown "$*" > $TMPFILE && ( xdg-open $TMPFILE > /dev/null 2>&1 & )
}
# Git clone + npm install
function gcn {
    url=$1;
    if [ -n "${1}" ]; then
        echo 'OK'
    else
        echo 'Koooooooooooooooo'
    fi
    cd ~/code;
    reponame=$(echo $url | awk -F/ '{print $NF}' | sed -e 's/.git$//');
    git clone $url $reponame;
    cd $reponame;
    npm install;
}

local pwd='%{$fg[blue]%}%c~%{$reset_color%}'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
set -o vi
source /usr/share/nvm/init-nvm.sh
