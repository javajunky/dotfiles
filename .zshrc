# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="cobalt2"

alias gum="git pull upstream master"

# Changed your .gitignore _after_ you have added / committed some files?
# run `gri` to untrack anything in your updated .gitignore
# Put this in your .zshrc file
alias gri="git ls-files --ignored --exclude-standard | xargs -0 git rm -r"


# Open all merge conflicts or currently changed files in VS Code
# Switch out `code` for `subl`, `vim`, `atom` or your editor's CLI
alias fix="git diff --name-only | uniq | xargs code"

# alias 🖕😏🖕="git push --force"

alias "git latest"="git for-each-ref --sort=-committerdate refs/heads/"

# Edit in VS Code
alias edit='code'

alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"

# Reload zsh config
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"

alias dev="cd $HOME/Development/htdocs"
alias desk="cd ~/Desktop"

alias ios="open -a Simulator"
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"

# Open all merge conflicts or currently changed files in Sublime Text
# Switch out 'subl' for 'vim', 'atom' or your editor's CLI
# written: Wes Bos
alias fix="git diff --name-only | uniq | xargs code"alias fix="git diff --name-only | uniq | xargs code"

alias flushDNS='dscacheutil -flushcache  && echo "Flushed DNS cache"' # flushDNS: Flush out the DNS Cache

alias ls='ls -GFh' # Better ls

# I don't think I use this anymore https://github.com/pindexis/qfc
# [[ -s "$HOME/.qfc/bin/qfc.sh" ]] && source "$HOME/.qfc/bin/qfc.sh"

#  Uses tree - install first:
# brew install tree
function t() {
  # Defaults to 3 levels deep, do more with `t 5` or `t 1`
  # pass additional args after
  tree -I '.git|node_modules|bower_components|.DS_Store' --dirsfirst --filelimit 15 -L ${1:-3} -aC $2
}

# Take a screenshot every n seconds
# Fun for making timelapse gifs later
# run `creep 20` for every 20 seconds
function creep() {
    while :; do; echo "📸" $(date +%H:%M:%S); screencapture -x ~/Screenshots/wil/$(date +%s).png; sleep $1; done
}

# red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  git
  node
  npm
  wd
  brew
  osx
  extract
  z
  zsh-syntax-highlighting
  zsh-autosuggestions
  dirnav
  bundler
  docker
  docker-compose
  dotenv
  Forklift
  rails
  ruby
)

source $ZSH/oh-my-zsh.sh

function dl() {
  svn checkout ${1:gs/tree\/master/trunk}
}

function openall() {
  for folder in */; do code $folder && hyper $folder; done
}

# [Starship cross-shell prompt](https://starship.rs)
eval "$(starship init zsh)"